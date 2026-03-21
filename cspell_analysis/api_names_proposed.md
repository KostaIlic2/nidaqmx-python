# nidaqmx API — Proposed Renames

36 proposed renames to fix unseparated words and unseparated initialisms in the
public API. Each entry shows the problematic token(s), the approach, and the
proposed name. Typos are excluded (they require fixes, not renames).

---

## Enum Member

6 issues in `generated/nidaqmx/constants.py`.

| Present Name | Problematic Item(s) | Approach(es) | Proposed Name |
|---|---|---|---|
| `EncoderZIndexPhase.AHIGH_BHIGH` | `AHIGH`, `BHIGH` | Split into `A_HIGH`, `B_HIGH` | `EncoderZIndexPhase.A_HIGH_B_HIGH` |
| `EncoderZIndexPhase.AHIGH_BLOW` | `AHIGH`, `BLOW` | Split into `A_HIGH`, `B_LOW` | `EncoderZIndexPhase.A_HIGH_B_LOW` |
| `EncoderZIndexPhase.ALOW_BHIGH` | `ALOW`, `BHIGH` | Split into `A_LOW`, `B_HIGH` | `EncoderZIndexPhase.A_LOW_B_HIGH` |
| `ProductCategory.USBDAQ` | `USBDAQ` | Split into `USB_DAQ` | `ProductCategory.USB_DAQ` |
| `UsageTypeAI.CURRENT_ACRMS` | `ACRMS` | Split into `AC_RMS` | `UsageTypeAI.CURRENT_AC_RMS` |
| `UsageTypeAI.VOLTAGE_ACRMS` | `ACRMS` | Split into `AC_RMS` | `UsageTypeAI.VOLTAGE_AC_RMS` |

---

## Error Code

26 issues in `generated/nidaqmx/error_codes.py`.

| Present Name | Problematic Item(s) | Approach(es) | Proposed Name |
|---|---|---|---|
| `DAQmxErrors.ACTION_SEPARATOR_REQUIRED_AFTER_BREAKING_CONNECTION_IN_SCANLIST` | `SCANLIST` | Split into `SCAN_LIST` | `DAQmxErrors.ACTION_SEPARATOR_REQUIRED_AFTER_BREAKING_CONNECTION_IN_SCAN_LIST` |
| `DAQmxErrors.CAPI_CANNOT_PERFORM_TASK_OPERATION_IN_ASYNC_CALLBACK` | `CAPI` | Drop `CAPI` | `DAQmxErrors.CANNOT_PERFORM_TASK_OPERATION_IN_ASYNC_CALLBACK` |
| `DAQmxErrors.CAPI_CANNOT_REGISTER_SYNC_EVENTS_FROM_MULTIPLE_THREADS` | `CAPI` | Drop `CAPI` | `DAQmxErrors.CANNOT_REGISTER_SYNC_EVENTS_FROM_MULTIPLE_THREADS` |
| `DAQmxErrors.CAPI_CHAN_INDEX_INVALID` | `CAPI` | Drop `CAPI` | `DAQmxErrors.CHAN_INDEX_INVALID` |
| `DAQmxErrors.CAPI_DEVICE_INDEX_INVALID` | `CAPI` | Drop `CAPI` | `DAQmxErrors.DEVICE_INDEX_INVALID` |
| `DAQmxErrors.CAPI_NO_EXTENDED_ERROR_INFO_AVAILABLE` | `CAPI` | Drop `CAPI` | `DAQmxErrors.NO_EXTENDED_ERROR_INFO_AVAILABLE` |
| `DAQmxErrors.CAPI_RESERVED_PARAM_NOT_NULL` | `CAPI` | Drop `CAPI` | `DAQmxErrors.RESERVED_PARAM_NOT_NULL` |
| `DAQmxErrors.CAPI_RESERVED_PARAM_NOT_NULL_NOR_EMPTY` | `CAPI` | Drop `CAPI` | `DAQmxErrors.RESERVED_PARAM_NOT_NULL_NOR_EMPTY` |
| `DAQmxErrors.CAPI_RESERVED_PARAM_NOT_ZERO` | `CAPI` | Drop `CAPI` | `DAQmxErrors.RESERVED_PARAM_NOT_ZERO` |
| `DAQmxErrors.CAPI_SYNC_CALLBACK_NOT_SUPPORTED_ON_THIS_PLATFORM` | `CAPI` | Drop `CAPI` | `DAQmxErrors.SYNC_CALLBACK_NOT_SUPPORTED_ON_THIS_PLATFORM` |
| `DAQmxErrors.CAPI_SYNC_EVENTS_TASK_STATE_CHANGE_NOT_ALLOWED_FROM_DIFFERENT_THREAD` | `CAPI` | Drop `CAPI` | `DAQmxErrors.SYNC_EVENTS_TASK_STATE_CHANGE_NOT_ALLOWED_FROM_DIFFERENT_THREAD` |
| `DAQmxErrors.CIHW_TIMED_SINGLE_POINT_NOT_SUPPORTED_FOR_MEAS_TYPE` | `CIHW` | Split into `CI_HW` | `DAQmxErrors.CI_HW_TIMED_SINGLE_POINT_NOT_SUPPORTED_FOR_MEAS_TYPE` |
| `DAQmxErrors.CONNECTION_IN_SCANLIST_MUST_WAIT_FOR_TRIG` | `SCANLIST` | Split into `SCAN_LIST` | `DAQmxErrors.CONNECTION_IN_SCAN_LIST_MUST_WAIT_FOR_TRIG` |
| `DAQmxErrors.DISCONNECTION_REQUIRED_IN_SCANLIST` | `SCANLIST` | Split into `SCAN_LIST` | `DAQmxErrors.DISCONNECTION_REQUIRED_IN_SCAN_LIST` |
| `DAQmxErrors.EXCEEDED_TOTAL_TIMETRIGGERS_AVAILABLE` | `TIMETRIGGERS` | Split into `TIME_TRIGGERS` | `DAQmxErrors.EXCEEDED_TOTAL_TIME_TRIGGERS_AVAILABLE` |
| `DAQmxErrors.EXTERNAL_TIMEBASE_RATE_NOTKNOWN_FOR_RATE` | `NOTKNOWN` | Split into `NOT_KNOWN` | `DAQmxErrors.EXTERNAL_TIMEBASE_RATE_NOT_KNOWN_FOR_RATE` |
| `DAQmxErrors.INVALID_SCANLIST` | `SCANLIST` | Split into `SCAN_LIST` | `DAQmxErrors.INVALID_SCAN_LIST` |
| `DAQmxErrors.INVALID_TIMEBASE_FOR_COHWTSP` | `COHWTSP` | Split into `CO_HW_TIMED_SINGLE_POINT` | `DAQmxErrors.INVALID_TIMEBASE_FOR_CO_HW_TIMED_SINGLE_POINT` |
| `DAQmxErrors.MULTIDEVICE_WITH_ON_DEMAND_TIMING` | `MULTIDEVICE` | Split into `MULTI_DEVICE` | `DAQmxErrors.MULTI_DEVICE_WITH_ON_DEMAND_TIMING` |
| `DAQmxErrors.NONBUFFERED_OR_NO_CHANNELS` | `NONBUFFERED` | Split into `NON_BUFFERED` | `DAQmxErrors.NON_BUFFERED_OR_NO_CHANNELS` |
| `DAQmxErrors.NONBUFFERED_READ_MORE_THAN_SAMPS_PER_CHAN` | `NONBUFFERED` | Split into `NON_BUFFERED` | `DAQmxErrors.NON_BUFFERED_READ_MORE_THAN_SAMPS_PER_CHAN` |
| `DAQmxErrors.SEND_ADV_CMPLT_AFTER_WAIT_FOR_TRIG_IN_SCANLIST` | `SCANLIST` | Split into `SCAN_LIST` | `DAQmxErrors.SEND_ADV_CMPLT_AFTER_WAIT_FOR_TRIG_IN_SCAN_LIST` |
| `DAQmxErrors.START_TRIG_CONFLICT_WITH_COHW_TIMED_SINGLE_PT` | `COHW` | Split into `CO_HW` | `DAQmxErrors.START_TRIG_CONFLICT_WITH_CO_HW_TIMED_SINGLE_PT` |
| `DAQmxErrors.SWITCH_SCANLIST_TOO_BIG` | `SCANLIST` | Split into `SCAN_LIST` | `DAQmxErrors.SWITCH_SCAN_LIST_TOO_BIG` |
| `DAQmxErrors.TRIG_WHEN_AOHW_TIMED_SINGLE_PT_SAMP_MODE` | `AOHW` | Split into `AO_HW` | `DAQmxErrors.TRIG_WHEN_AO_HW_TIMED_SINGLE_PT_SAMP_MODE` |
| `DAQmxErrors.TWO_WAIT_FOR_TRIGS_AFTER_CONNECTION_IN_SCANLIST` | `SCANLIST` | Split into `SCAN_LIST` | `DAQmxErrors.TWO_WAIT_FOR_TRIGS_AFTER_CONNECTION_IN_SCAN_LIST` |

---

## Warning Code

1 issue in `generated/nidaqmx/error_codes.py`.

| Present Name | Problematic Item(s) | Approach(es) | Proposed Name |
|---|---|---|---|
| `DAQmxWarnings.CAPI_STRING_TRUNCATED_TO_FIT_BUFFER` | `CAPI` | Drop `CAPI` | `DAQmxWarnings.STRING_TRUNCATED_TO_FIT_BUFFER` |

---

## Channel Property

2 issues in `generated/nidaqmx/task/channels/_ai_channel.py`.

| Present Name | Problematic Item(s) | Approach(es) | Proposed Name |
|---|---|---|---|
| `AIChannel.ai_current_acrms_units` | `acrms` | Split into `ac_rms` | `AIChannel.ai_current_ac_rms_units` |
| `AIChannel.ai_voltage_acrms_units` | `acrms` | Split into `ac_rms` | `AIChannel.ai_voltage_ac_rms_units` |

---

## System Property

1 issue in `generated/nidaqmx/system/device.py`. Note: `Device.tedshwteds_supported` is already deprecated since 0.7.0 (use `hwteds_supported`) and is excluded here.

| Present Name | Problematic Item(s) | Approach(es) | Proposed Name |
|---|---|---|---|
| `Device.hwteds_supported` | `hwteds` | Split into `hw_teds` | `Device.hw_teds_supported` |
