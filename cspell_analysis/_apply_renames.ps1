$ErrorActionPreference = "Stop"
$inFile  = "$PSScriptRoot\..\api_names_with_changes.txt"
$outFile = $inFile   # overwrite in place

# Each entry: [0] = text to find (trimmed), [1] = replacement (trimmed)
# Process longest/most-specific first to avoid partial-match issues.
# Combined PRPTY+DIFFT entries are listed as single mappings.
$renames = @(
    # ── GPS class rename (do before member renames) ──────────────────────────
    @("GpsSignalType.IRIGB",    "GPSSignalType.IRIG_B"),
    @("GpsSignalType.NONE",     "GPSSignalType.NONE"),
    @("GpsSignalType.PPS",      "GPSSignalType.PPS"),
    @("GpsSignalType",          "GPSSignalType"),

    # ── HWTSP ────────────────────────────────────────────────────────────────
    @("DAQmxErrors.CANNOT_READ_WHEN_AUTO_START_FALSE_HW_TIMED_SINGLE_PT_AND_TASK_NOT_RUNNING",
      "DAQmxErrors.CANNOT_READ_WHEN_AUTO_START_FALSE_HW_TIMED_SINGLE_POINT_AND_TASK_NOT_RUNNING"),
    @("DAQmxErrors.CANNOT_WRITE_NOT_STARTED_AUTO_START_FALSE_NOT_ON_DEMAND_HW_TIMED_SGL_PT",
      "DAQmxErrors.CANNOT_WRITE_NOT_STARTED_AUTO_START_FALSE_NOT_ON_DEMAND_HW_TIMED_SINGLE_POINT"),
    @("DAQmxErrors.ATTRIBUTE_NOT_SUPPORTED_UNLESS_HWTSP",
      "DAQmxErrors.ATTRIBUTE_NOT_SUPPORTED_UNLESS_HW_TIMED_SINGLE_POINT"),
    @("DAQmxErrors.AVERAGING_WHEN_NOT_INTERNAL_HWTSP",
      "DAQmxErrors.AVERAGING_WHEN_NOT_INTERNAL_HW_TIMED_SINGLE_POINT"),
    @("DAQmxErrors.DELAY_FROM_SAMPLE_CLOCK_OUT_OF_RANGE_FOR_HWTSP",
      "DAQmxErrors.DELAY_FROM_SAMPLE_CLOCK_OUT_OF_RANGE_FOR_HW_TIMED_SINGLE_POINT"),
    @("DAQmxErrors.DEVICE_DOES_NOT_SUPPORT_HWTSP",
      "DAQmxErrors.DEVICE_DOES_NOT_SUPPORT_HW_TIMED_SINGLE_POINT"),
    @("DAQmxErrors.HWTSP_MULTI_SAMPLE_WRITE",
      "DAQmxErrors.HW_TIMED_SINGLE_POINT_MULTI_SAMPLE_WRITE"),
    @("DAQmxErrors.RATE_TOO_FAST_FOR_HWTSP",
      "DAQmxErrors.RATE_TOO_FAST_FOR_HW_TIMED_SINGLE_POINT"),

    # ── Typo report — unseparated (with _PT fix already folded in) ───────────
    @("DAQmxErrors.INVALID_TIMEBASE_FOR_COHWTSP",
      "DAQmxErrors.INVALID_TIMEBASE_FOR_CO_HW_TIMED_SINGLE_POINT"),
    @("DAQmxErrors.START_TRIG_CONFLICT_WITH_COHW_TIMED_SINGLE_PT",
      "DAQmxErrors.START_TRIG_CONFLICT_WITH_CO_HW_TIMED_SINGLE_POINT"),
    @("DAQmxErrors.TRIG_WHEN_AOHW_TIMED_SINGLE_PT_SAMP_MODE",
      "DAQmxErrors.TRIG_WHEN_AO_HW_TIMED_SINGLE_POINT_SAMP_MODE"),
    @("DAQmxErrors.CIHW_TIMED_SINGLE_POINT_NOT_SUPPORTED_FOR_MEAS_TYPE",
      "DAQmxErrors.CI_HW_TIMED_SINGLE_POINT_NOT_SUPPORTED_FOR_MEAS_TYPE"),

    # ── Typo report — other unseparated ─────────────────────────────────────
    @("AIChannel.ai_current_acrms_units",   "AIChannel.ai_current_ac_rms_units"),
    @("AIChannel.ai_voltage_acrms_units",   "AIChannel.ai_voltage_ac_rms_units"),
    @("UsageTypeAI.CURRENT_ACRMS",          "UsageTypeAI.CURRENT_AC_RMS"),
    @("UsageTypeAI.VOLTAGE_ACRMS",          "UsageTypeAI.VOLTAGE_AC_RMS"),
    @("DAQmxErrors.ACTION_SEPARATOR_REQUIRED_AFTER_BREAKING_CONNECTION_IN_SCANLIST",
      "DAQmxErrors.ACTION_SEPARATOR_REQUIRED_AFTER_BREAKING_CONNECTION_IN_SCAN_LIST"),
    @("DAQmxErrors.CAPI_CANNOT_PERFORM_TASK_OPERATION_IN_ASYNC_CALLBACK",
      "DAQmxErrors.C_API_CANNOT_PERFORM_TASK_OPERATION_IN_ASYNC_CALLBACK"),
    @("DAQmxErrors.CAPI_CANNOT_REGISTER_SYNC_EVENTS_FROM_MULTIPLE_THREADS",
      "DAQmxErrors.C_API_CANNOT_REGISTER_SYNC_EVENTS_FROM_MULTIPLE_THREADS"),
    @("DAQmxErrors.CAPI_CHAN_INDEX_INVALID",
      "DAQmxErrors.C_API_CHAN_INDEX_INVALID"),
    @("DAQmxErrors.CAPI_DEVICE_INDEX_INVALID",
      "DAQmxErrors.C_API_DEVICE_INDEX_INVALID"),
    @("DAQmxErrors.CAPI_NO_EXTENDED_ERROR_INFO_AVAILABLE",
      "DAQmxErrors.C_API_NO_EXTENDED_ERROR_INFO_AVAILABLE"),
    @("DAQmxErrors.CAPI_RESERVED_PARAM_NOT_NULL_NOR_EMPTY",
      "DAQmxErrors.C_API_RESERVED_PARAM_NOT_NULL_NOR_EMPTY"),
    @("DAQmxErrors.CAPI_RESERVED_PARAM_NOT_NULL",
      "DAQmxErrors.C_API_RESERVED_PARAM_NOT_NULL"),
    @("DAQmxErrors.CAPI_RESERVED_PARAM_NOT_ZERO",
      "DAQmxErrors.C_API_RESERVED_PARAM_NOT_ZERO"),
    @("DAQmxErrors.CAPI_SYNC_CALLBACK_NOT_SUPPORTED_ON_THIS_PLATFORM",
      "DAQmxErrors.C_API_SYNC_CALLBACK_NOT_SUPPORTED_ON_THIS_PLATFORM"),
    @("DAQmxErrors.CAPI_SYNC_EVENTS_TASK_STATE_CHANGE_NOT_ALLOWED_FROM_DIFFERENT_THREAD",
      "DAQmxErrors.C_API_SYNC_EVENTS_TASK_STATE_CHANGE_NOT_ALLOWED_FROM_DIFFERENT_THREAD"),
    @("DAQmxWarnings.CAPI_STRING_TRUNCATED_TO_FIT_BUFFER",
      "DAQmxWarnings.C_API_STRING_TRUNCATED_TO_FIT_BUFFER"),
    @("DAQmxErrors.CONNECTION_IN_SCANLIST_MUST_WAIT_FOR_TRIG",
      "DAQmxErrors.CONNECTION_IN_SCAN_LIST_MUST_WAIT_FOR_TRIG"),
    @("DAQmxErrors.DISCONNECTION_REQUIRED_IN_SCANLIST",
      "DAQmxErrors.DISCONNECTION_REQUIRED_IN_SCAN_LIST"),
    @("DAQmxErrors.EXCEEDED_TOTAL_TIMETRIGGERS_AVAILABLE",
      "DAQmxErrors.EXCEEDED_TOTAL_TIME_TRIGGERS_AVAILABLE"),
    @("DAQmxErrors.EXTERNAL_TIMEBASE_RATE_NOTKNOWN_FOR_RATE",
      "DAQmxErrors.EXTERNAL_TIMEBASE_RATE_NOT_KNOWN_FOR_RATE"),
    @("DAQmxErrors.FILTER_DELAY_REMOVAL_NOT_POSSSIBLE_WITH_ANALOG_TRIGGER",
      "DAQmxErrors.FILTER_DELAY_REMOVAL_NOT_POSSIBLE_WITH_ANALOG_TRIGGER"),
    @("DAQmxErrors.INVALID_ATTENTUATION_BASED_ON_MIN_MAX",
      "DAQmxErrors.INVALID_ATTENUATION_BASED_ON_MIN_MAX"),
    @("DAQmxErrors.INVALID_SCANLIST",           "DAQmxErrors.INVALID_SCAN_LIST"),
    @("DAQmxErrors.INVALIDC_DAQ_SYNC_PORT_CONNECTION_FORMAT",
      "DAQmxErrors.INVALID_CDAQ_SYNC_PORT_CONNECTION_FORMAT"),
    @("DAQmxErrors.MAX_SOUND_PRESSURE_MIC_SENSITIVIT_RELATED_AI_PROPERTIES_NOT_SUPPORTED_BY_DEV",
      "DAQmxErrors.MAX_SOUND_PRESSURE_MIC_SENSITIVITY_RELATED_AI_PROPERTIES_NOT_SUPPORTED_BY_DEV"),
    @("DAQmxErrors.MULTIDEVICE_WITH_ON_DEMAND_TIMING",
      "DAQmxErrors.MULTI_DEVICE_WITH_ON_DEMAND_TIMING"),
    @("DAQmxErrors.MULTIPLE_SUBSYTEM_CALIBRATION",
      "DAQmxErrors.MULTIPLE_SUBSYSTEM_CALIBRATION"),
    @("DAQmxErrors.NONBUFFERED_OR_NO_CHANNELS",
      "DAQmxErrors.NON_BUFFERED_OR_NO_CHANNELS"),
    @("DAQmxErrors.NONBUFFERED_READ_MORE_THAN_SAMPS_PER_CHAN",
      "DAQmxErrors.NON_BUFFERED_READ_MORE_THAN_SAMPS_PER_CHAN"),
    @("DAQmxErrors.ONLY_PEM_OR_DER_CERTITICATES_ACCEPTED",
      "DAQmxErrors.ONLY_PEM_OR_DER_CERTIFICATES_ACCEPTED"),
    @("DAQmxErrors.SEND_ADV_CMPLT_AFTER_WAIT_FOR_TRIG_IN_SCANLIST",
      "DAQmxErrors.SEND_ADV_CMPLT_AFTER_WAIT_FOR_TRIG_IN_SCAN_LIST"),
    @("DAQmxErrors.SWITCH_SCANLIST_TOO_BIG",    "DAQmxErrors.SWITCH_SCAN_LIST_TOO_BIG"),
    @("DAQmxErrors.TWO_WAIT_FOR_TRIGS_AFTER_CONNECTION_IN_SCANLIST",
      "DAQmxErrors.TWO_WAIT_FOR_TRIGS_AFTER_CONNECTION_IN_SCAN_LIST"),
    @("Device.hwteds_supported",                "Device.hw_teds_supported"),
    @("EncoderZIndexPhase.AHIGH_BHIGH",         "EncoderZIndexPhase.A_HIGH_B_HIGH"),
    @("EncoderZIndexPhase.AHIGH_BLOW",          "EncoderZIndexPhase.A_HIGH_B_LOW"),
    @("EncoderZIndexPhase.ALOW_BHIGH",          "EncoderZIndexPhase.A_LOW_B_HIGH"),
    @("EncoderZIndexPhase.ALOW_BLOW",           "EncoderZIndexPhase.A_LOW_B_LOW"),
    @("ProductCategory.USBDAQ",                 "ProductCategory.USB_DAQ"),

    # ── ASYN ─────────────────────────────────────────────────────────────────
    @("DAQmxErrors.INVALID_ASYN_OP_HANDLE",     "DAQmxErrors.INVALID_ASYNC_OP_HANDLE"),

    # ── COEF → COEFF (4) ─────────────────────────────────────────────────────
    @("DAQmxErrors.CAL_CHAN_FORWARD_POLY_COEF_NOT_SPECD",
      "DAQmxErrors.CAL_CHAN_FORWARD_POLY_COEFF_NOT_SPECD"),
    @("DAQmxErrors.CAL_CHAN_REVERSE_POLY_COEF_NOT_SPECD",
      "DAQmxErrors.CAL_CHAN_REVERSE_POLY_COEFF_NOT_SPECD"),
    @("DAQmxErrors.FORWARD_POLYNOMIAL_COEF_NOT_SPECD",
      "DAQmxErrors.FORWARD_POLYNOMIAL_COEFF_NOT_SPECD"),
    @("DAQmxErrors.REVERSE_POLYNOMIAL_COEF_NOT_SPECD",
      "DAQmxErrors.REVERSE_POLYNOMIAL_COEFF_NOT_SPECD"),

    # ── COULDNT ───────────────────────────────────────────────────────────────
    @("DAQmxErrors.FIRMWARE_COULDNT_UPDATE",    "DAQmxErrors.FIRMWARE_COULD_NOT_UPDATE"),

    # ── DIFFT — combined with PRPTY where they overlap ────────────────────────
    @("DAQmxErrors.DIFFT_AI_INPUT_SRC_IN_ONE_CHAN_GROUP",
      "DAQmxErrors.DIFFERENT_AI_INPUT_SRC_IN_ONE_CHAN_GROUP"),
    @("DAQmxErrors.DIFFT_INTERNAL_AI_INPUT_SRCS",
      "DAQmxErrors.DIFFERENT_INTERNAL_AI_INPUT_SRCS"),
    @("DAQmxErrors.DIFFT_SYNC_PULSE_SRC_AND_SAMP_CLK_TIMEBASE_SRC_DEV_MULTI_DEV_TASK",
      "DAQmxErrors.DIFFERENT_SYNC_PULSE_SRC_AND_SAMP_CLK_TIMEBASE_SRC_DEV_MULTI_DEV_TASK"),
    @("DAQmxErrors.GET_ACTIVE_DEV_PRPTY_FAILED_DUE_TO_DIFFT_VALS",
      "DAQmxErrors.GET_ACTIVE_DEV_PROPERTY_FAILED_DUE_TO_DIFFERENT_VALS"),
    @("DAQmxErrors.PRPTY_GET_IMPLIED_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS",
      "DAQmxErrors.PROPERTY_GET_IMPLIED_ACTIVE_CHAN_FAILED_DUE_TO_DIFFERENT_VALS"),
    @("DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS",
      "DAQmxErrors.PROPERTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFERENT_VALS"),
    @("DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFT_VALUES",
      "DAQmxErrors.PROPERTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFERENT_VALUES"),
    @("DAQmxErrors.PRPTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS",
      "DAQmxErrors.PROPERTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFERENT_VALS"),

    # ── DOESNT ────────────────────────────────────────────────────────────────
    @("DAQmxErrors.LAB_VIEW_VERSION_DOESNT_SUPPORT_DA_QMX_EVENTS",
      "DAQmxErrors.LAB_VIEW_VERSION_DOES_NOT_SUPPORT_DA_QMX_EVENTS"),
    @("DAQmxErrors.SAMP_CLK_RATE_DOESNT_MATCH_SAMP_CLK_SRC",
      "DAQmxErrors.SAMP_CLK_RATE_DOES_NOT_MATCH_SAMP_CLK_SRC"),

    # ── DONT ──────────────────────────────────────────────────────────────────
    @("RegenerationMode.DONT_ALLOW_REGENERATION", "RegenerationMode.DO_NOT_ALLOW_REGENERATION"),
    @("DAQmxErrors.CHANGE_DETECTION_RISING_AND_FALLING_EDGE_CHAN_DONT_MATCH",
      "DAQmxErrors.CHANGE_DETECTION_RISING_AND_FALLING_EDGE_CHAN_DO_NOT_MATCH"),
    @("DAQmxErrors.DONT_MIX_SYNC_PULSE_AND_SAMP_CLK_TIMEBASE_ON_449_X",
      "DAQmxErrors.DO_NOT_MIX_SYNC_PULSE_AND_SAMP_CLK_TIMEBASE_ON_449_X"),

    # ── DSTAR ─────────────────────────────────────────────────────────────────
    @("DAQmxErrors.ROUTING_DEST_TERM_PXI_DSTAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING",
      "DAQmxErrors.ROUTING_DEST_TERM_PXI_D_STAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING"),
    @("DAQmxErrors.ROUTING_DEST_TERM_PXI_DSTAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING",
      "DAQmxErrors.ROUTING_DEST_TERM_PXI_D_STAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING"),
    @("DAQmxErrors.ROUTING_SRC_TERM_PXI_DSTAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING",
      "DAQmxErrors.ROUTING_SRC_TERM_PXI_D_STAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING"),
    @("DAQmxErrors.ROUTING_SRC_TERM_PXI_DSTAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING",
      "DAQmxErrors.ROUTING_SRC_TERM_PXI_D_STAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING"),

    # ── FREQOUT ───────────────────────────────────────────────────────────────
    @("DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_2",
      "DAQmxErrors.FREQ_OUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_2"),
    @("DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_3",
      "DAQmxErrors.FREQ_OUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_3"),
    @("DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY",
      "DAQmxErrors.FREQ_OUT_CANNOT_PRODUCE_DESIRED_FREQUENCY"),
    @("DAQmxErrors.INVALID_ACQ_TYPE_FOR_FREQOUT",
      "DAQmxErrors.INVALID_ACQ_TYPE_FOR_FREQ_OUT"),
    @("DAQmxErrors.WRITE_FAILED_MULTIPLE_CTRS_WITH_FREQOUT",
      "DAQmxErrors.WRITE_FAILED_MULTIPLE_CTRS_WITH_FREQ_OUT"),

    # ── hshk ──────────────────────────────────────────────────────────────────
    @("ExportSignals.hshk_event_delay",                       "ExportSignals.handshaking_event_delay"),
    @("ExportSignals.hshk_event_interlocked_assert_on_start", "ExportSignals.handshaking_event_interlocked_assert_on_start"),
    @("ExportSignals.hshk_event_interlocked_asserted_lvl",    "ExportSignals.handshaking_event_interlocked_asserted_lvl"),
    @("ExportSignals.hshk_event_interlocked_deassert_delay",  "ExportSignals.handshaking_event_interlocked_deassert_delay"),
    @("ExportSignals.hshk_event_output_behavior",             "ExportSignals.handshaking_event_output_behavior"),
    @("ExportSignals.hshk_event_output_term",                 "ExportSignals.handshaking_event_output_term"),
    @("ExportSignals.hshk_event_pulse_polarity",              "ExportSignals.handshaking_event_pulse_polarity"),
    @("ExportSignals.hshk_event_pulse_width",                 "ExportSignals.handshaking_event_pulse_width"),
    @("Timing.hshk_delay_after_xfer",                         "Timing.handshaking_delay_after_xfer"),
    @("Timing.hshk_sample_input_data_when",                   "Timing.handshaking_sample_input_data_when"),
    @("Timing.hshk_start_cond",                               "Timing.handshaking_start_cond"),

    # ── hysts ─────────────────────────────────────────────────────────────────
    @("ReferenceTrigger.anlg_multi_edge_hysts",  "ReferenceTrigger.anlg_multi_edge_hyst"),
    @("StartTrigger.anlg_multi_edge_hysts",      "StartTrigger.anlg_multi_edge_hyst"),

    # ── MULT → MULTIPLE ───────────────────────────────────────────────────────
    @("DAQmxErrors.AI_INPUT_BUFFER_SIZE_NOT_MULT_OF_XFER_SIZE",
      "DAQmxErrors.AI_INPUT_BUFFER_SIZE_NOT_MULTIPLE_OF_XFER_SIZE"),
    @("DAQmxErrors.INTERNAL_AI_INPUT_SRC_IN_MULT_CHAN_GROUPS",
      "DAQmxErrors.INTERNAL_AI_INPUT_SRC_IN_MULTIPLE_CHAN_GROUPS"),
    @("DAQmxErrors.MULT_DEVS_MULT_PHYS_CHANS",
      "DAQmxErrors.MULTIPLE_DEVS_MULTIPLE_PHYS_CHANS"),
    @("DAQmxErrors.MULT_SCAN_OPS_IN_ONE_CHASSIS",
      "DAQmxErrors.MULTIPLE_SCAN_OPS_IN_ONE_CHASSIS"),
    @("DAQmxErrors.OUTPUT_BUFFER_SIZE_NOT_MULT_OF_XFER_SIZE",
      "DAQmxErrors.OUTPUT_BUFFER_SIZE_NOT_MULTIPLE_OF_XFER_SIZE"),
    @("DAQmxErrors.SAMP_PER_CHAN_NOT_MULT_OF_XFER_SIZE",
      "DAQmxErrors.SAMP_PER_CHAN_NOT_MULTIPLE_OF_XFER_SIZE"),
    @("DAQmxErrors.WAVEFORM_LENGTH_NOT_MULT_OF_QUANTUM",
      "DAQmxErrors.WAVEFORM_LENGTH_NOT_MULTIPLE_OF_QUANTUM"),
    @("DAQmxErrors.WRITE_OFFSET_NOT_MULT_OF_INCR",
      "DAQmxErrors.WRITE_OFFSET_NOT_MULTIPLE_OF_INCR"),

    # ── numpy ─────────────────────────────────────────────────────────────────
    @("InStream.read_into(numpy_array)",   "InStream.read_into(data)"),
    @("OutStream.write(numpy_array)",      "OutStream.write(data)"),

    # ── nums → numbers ────────────────────────────────────────────────────────
    @("Device.accessory_product_nums",      "Device.accessory_product_numbers"),
    @("Device.accessory_serial_nums",       "Device.accessory_serial_numbers"),
    @("Device.id_pin_mem_serial_nums",      "Device.id_pin_mem_serial_numbers"),

    # ── onbrd → onboard ───────────────────────────────────────────────────────
    @("InStream.input_onbrd_buf_size",      "InStream.input_onboard_buf_size"),
    @("OutStream.output_onbrd_buf_size",    "OutStream.output_onboard_buf_size"),

    # ── outp → output ─────────────────────────────────────────────────────────
    @("Timing.cfg_burst_handshaking_timing_export_clock(sample_clk_outp_term)",
      "Timing.cfg_burst_handshaking_timing_export_clock(sample_clk_output_term)"),

    # ── PRETRIG / POSTTRIG ────────────────────────────────────────────────────
    @("DAQmxWarnings.PRETRIG_COERCION",         "DAQmxWarnings.PRETRIGGER_COERCION"),
    @("DAQmxErrors.TOO_MANY_PRETRIG_PLUS_MIN_POST_TRIG_SAMPS",
      "DAQmxErrors.TOO_MANY_PRETRIGGER_PLUS_MIN_POSTTRIGGER_SAMPS"),
    @("DAQmxErrors.TOO_MANY_POST_TRIG_SAMPS_PER_CHAN",
      "DAQmxErrors.TOO_MANY_POSTTRIGGER_SAMPS_PER_CHAN"),
    @("ReferenceTrigger.pretrig_samples",       "ReferenceTrigger.pretrigger_samples"),

    # ── PRPTY → PROPERTY (10 non-overlapping; 5 PRPTY+DIFFT handled above) ───
    @("DAQmxErrors.ACTIVE_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PRPTY",
      "DAQmxErrors.ACTIVE_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PROPERTY"),
    @("DAQmxErrors.ACTIVE_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PRPTY",
      "DAQmxErrors.ACTIVE_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PROPERTY"),
    @("DAQmxErrors.ACTIVE_PHYS_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PRPTY",
      "DAQmxErrors.ACTIVE_PHYS_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PROPERTY"),
    @("DAQmxErrors.ACTIVE_PHYS_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PRPTY",
      "DAQmxErrors.ACTIVE_PHYS_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PROPERTY"),
    @("DAQmxErrors.DIFFERENT_PRPTY_VALS_NOT_SUPPORTED_ON_DEV",
      "DAQmxErrors.DIFFERENT_PROPERTY_VALS_NOT_SUPPORTED_ON_DEV"),
    @("DAQmxErrors.DIG_PRPTY_CANNOT_BE_SET_PER_LINE",
      "DAQmxErrors.DIG_PROPERTY_CANNOT_BE_SET_PER_LINE"),
    @("DAQmxErrors.F_64_PRPTY_VAL_NOT_UNSIGNED_INT",
      "DAQmxErrors.F_64_PROPERTY_VAL_NOT_UNSIGNED_INT"),
    @("DAQmxErrors.ONLY_USE_PAUSE_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES",
      "DAQmxErrors.ONLY_USE_PAUSE_TRIG_SRC_PROPERTY_WITH_DEV_DATA_LINES"),
    @("DAQmxErrors.ONLY_USE_REF_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES",
      "DAQmxErrors.ONLY_USE_REF_TRIG_SRC_PROPERTY_WITH_DEV_DATA_LINES"),
    @("DAQmxErrors.ONLY_USE_START_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES",
      "DAQmxErrors.ONLY_USE_START_TRIG_SRC_PROPERTY_WITH_DEV_DATA_LINES"),

    # ── RQST → REQ ────────────────────────────────────────────────────────────
    @("DAQmxErrors.NOT_ENOUGH_SAMPS_WRITTEN_FOR_INITIAL_XFER_RQST_CONDITION",
      "DAQmxErrors.NOT_ENOUGH_SAMPS_WRITTEN_FOR_INITIAL_XFER_REQ_CONDITION"),

    # ── UNAVAIL → UNAVAILABLE ─────────────────────────────────────────────────
    @("DAQmxErrors.PROPERTY_UNAVAIL_WHEN_USING_ONBOARD_MEMORY",
      "DAQmxErrors.PROPERTY_UNAVAILABLE_WHEN_USING_ONBOARD_MEMORY"),

    # ── zidx → z_index ────────────────────────────────────────────────────────
    @("CIChannelCollection.add_ci_ang_encoder_chan(zidx_enable)",
      "CIChannelCollection.add_ci_ang_encoder_chan(z_index_enable)"),
    @("CIChannelCollection.add_ci_ang_encoder_chan(zidx_phase)",
      "CIChannelCollection.add_ci_ang_encoder_chan(z_index_phase)"),
    @("CIChannelCollection.add_ci_ang_encoder_chan(zidx_val)",
      "CIChannelCollection.add_ci_ang_encoder_chan(z_index_val)"),
    @("CIChannelCollection.add_ci_lin_encoder_chan(zidx_enable)",
      "CIChannelCollection.add_ci_lin_encoder_chan(z_index_enable)"),
    @("CIChannelCollection.add_ci_lin_encoder_chan(zidx_phase)",
      "CIChannelCollection.add_ci_lin_encoder_chan(z_index_phase)"),
    @("CIChannelCollection.add_ci_lin_encoder_chan(zidx_val)",
      "CIChannelCollection.add_ci_lin_encoder_chan(z_index_val)"),

    # ── ONBOARD appendix (ON_BOARD → ONBOARD) ────────────────────────────────
    @("DeassertCondition.ON_BOARD_MEMORY_FULL",
      "DeassertCondition.ONBOARD_MEMORY_FULL"),
    @("DeassertCondition.ON_BOARD_MEMORY_MORE_THAN_HALF_FULL",
      "DeassertCondition.ONBOARD_MEMORY_MORE_THAN_HALF_FULL"),
    @("InputDataTransferCondition.ON_BOARD_MEMORY_MORE_THAN_HALF_FULL",
      "InputDataTransferCondition.ONBOARD_MEMORY_MORE_THAN_HALF_FULL"),
    @("InputDataTransferCondition.ON_BOARD_MEMORY_NOT_EMPTY",
      "InputDataTransferCondition.ONBOARD_MEMORY_NOT_EMPTY"),
    @("OutputDataTransferCondition.ON_BOARD_MEMORY_EMPTY",
      "OutputDataTransferCondition.ONBOARD_MEMORY_EMPTY"),
    @("OutputDataTransferCondition.ON_BOARD_MEMORY_HALF_FULL_OR_LESS",
      "OutputDataTransferCondition.ONBOARD_MEMORY_HALF_FULL_OR_LESS"),
    @("OutputDataTransferCondition.ON_BOARD_MEMORY_LESS_THAN_FULL",
      "OutputDataTransferCondition.ONBOARD_MEMORY_LESS_THAN_FULL"),
    @("DAQmxErrors.CANT_USE_ONLY_ON_BOARD_MEM_WITH_PROGRAMMED_IO",
      "DAQmxErrors.CANT_USE_ONLY_ONBOARD_MEM_WITH_PROGRAMMED_IO"),
    @("DAQmxErrors.INSUFFICIENT_ON_BOARD_MEM_FOR_NUM_RECS_AND_SAMPS",
      "DAQmxErrors.INSUFFICIENT_ONBOARD_MEM_FOR_NUM_RECS_AND_SAMPS"),
    @("DAQmxErrors.TIMING_ENGINE_DOES_NOT_SUPPORT_ON_BOARD_MEMORY",
      "DAQmxErrors.TIMING_ENGINE_DOES_NOT_SUPPORT_ONBOARD_MEMORY"),

    # ── PROP/PROPS appendix ───────────────────────────────────────────────────
    @("DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_CONFLICTING_PROP",
      "DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_CONFLICTING_PROPERTY"),
    @("DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_NOT_SUPPORTED_WITH_PROP_SET",
      "DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_NOT_SUPPORTED_WITH_PROPERTY_SET"),
    @("DAQmxErrors.ASSOCIATED_CHANS_HAVE_CONFLICTING_PROPS",
      "DAQmxErrors.ASSOCIATED_CHANS_HAVE_CONFLICTING_PROPERTIES")
)

# Build lookup: trimmedLine → replacement.  Longer keys first avoids prefix shadowing.
$lookup = [System.Collections.Generic.Dictionary[string,string]]::new([System.StringComparer]::Ordinal)
foreach ($pair in $renames) {
    $lookup[$pair[0]] = $pair[1]
}

# Process file line by line
$applied  = 0
$lines = Get-Content $inFile
$out = [System.Collections.Generic.List[string]]::new($lines.Count + 30)
foreach ($line in $lines) {
    $trimmed = $line.TrimStart()
    if ($lookup.ContainsKey($trimmed)) {
        $indent = $line.Substring(0, $line.Length - $line.TrimStart().Length)
        $out.Add($indent + $lookup[$trimmed])
        $applied++
    } else {
        $out.Add($line)
    }
}

# Append dictionary section
$out.Add("")
$out.Add("# Items to add to the dictionary")
$out.Add("# (no rename needed - retain as-is in the API)")
$out.Add("#")
$out.Add("# From ASYN section:")
$out.Add("#   ASYNC")
$out.Add("#")
$out.Add("# From COEF section:")
$out.Add("#   coeff, coeffs, COEFF, COEFFS")
$out.Add("#")
$out.Add("# From CFGD section:")
$out.Add("#   CFGD")
$out.Add("#")
$out.Add("# From CLKS section:")
$out.Add("#   CLKS")
$out.Add("#")
$out.Add("# From CONV section:")
$out.Add("#   CONV, conv")
$out.Add("#")
$out.Add("# From CTRS section:")
$out.Add("#   CTRS")
$out.Add("#")
$out.Add("# From ELEC section (add full names, not the abbreviation ELEC):")
$out.Add("#   MISMATCHED_ELEC_PHYS_VALUES")
$out.Add("#   TEDS_MIN_ELEC_VAL_GE_MAX_ELEC_VAL")
$out.Add("#")
$out.Add("# From ethernet section:")
$out.Add("#   ethernet")
$out.Add("#")
$out.Add("# From ISOC section:")
$out.Add("#   ISOC")
$out.Add("#")
$out.Add("# From lvls section:")
$out.Add("#   lvls")
$out.Add("#")
$out.Add("# From MIOAI section:")
$out.Add("#   MIOAIConvertTimebaseSource")
$out.Add("#")
$out.Add("# From PRESCALED section:")
$out.Add("#   PRESCALED, prescaled")
$out.Add("#")
$out.Add("# From PRESCALER section:")
$out.Add("#   PRESCALER, prescaler")
$out.Add("#")
$out.Add("# From PRETRIGGER section (add all four):")
$out.Add("#   PRETRIGGER, pretrigger, POSTTRIGGER, posttrigger")
$out.Add("#")
$out.Add("# From SAMPS section:")
$out.Add("#   SAMPS, samps")
$out.Add("#")
$out.Add("# From SMIO section:")
$out.Add("#   SMIO")
$out.Add("#")
$out.Add("# From SPECD section:")
$out.Add("#   SPECD")
$out.Add("#")
$out.Add("# From TCPIP section:")
$out.Add("#   TCPIP, tcpip")
$out.Add("#")
$out.Add("# From TRIGS section:")
$out.Add("#   TRIGS, trigs")

$out | Set-Content $inFile -Encoding UTF8
Write-Host "Done. Applied $applied renames out of $($renames.Count) defined."
