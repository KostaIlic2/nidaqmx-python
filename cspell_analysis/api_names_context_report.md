# api_names.txt — cspell context report

51 distinct flagged words · 282 total issues

## `ASYN`

| Line | Content |
| ---: | ------- |
| [:1612](../api_names.txt#L1612) | `DAQmxErrors.INVALID_ASYN_OP_HANDLE` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul><li>Add <code>ASYNC</code> to the Python DAQmx approved terminology.</li><li>Deprecate <code>DAQmxErrors.INVALID_ASYN_OP_HANDLE</code> and replace with <code>DAQmxErrors.INVALID_ASYNC_OP_HANDLE</code>.</li></ul></td></tr>
<tr><td><b>Rationale</b></td><td>Web search for <em>asynchronous</em> shows <code>ASYNC</code> (ASYNChronous) is the dominant industry abbreviation across electronics, hardware, and telecom — and is the form Python itself uses (<code>async</code>, <code>asyncio</code>). <code>ASYN</code> is a minority IT variant used in the C DAQmx API but not formally approved as a Python DAQmx abbreviation.<br><br>The search was extended to the privative base <em>synchronous</em> to verify consistency for the pair, in case both abbreviations are needed. <code>SYNC</code> (SYNChronous) is the dominant abbreviation for synchronous across computing, programming, and electronics. The <code>SYNC</code>/<code>ASYNC</code> pair is therefore the natural choice for the Python API, mirroring Python's own <code>sync</code>/<code>async</code> convention and the privative relationship between the two words.</td></tr>
</table>

## `CFGD`

| Line | Content |
| ---: | ------- |
| [:1360](../api_names.txt#L1360) | `DAQmxErrors.DIG_FILTER_INTERVAL_ALREADY_CFGD` |
| [:1929](../api_names.txt#L1929) | `DAQmxErrors.NO_INPUT_ON_PORT_CFGD_FOR_WATCHDOG_OUTPUT` |
| [:2162](../api_names.txt#L2162) | `DAQmxErrors.PROG_FILTER_CLK_CFGD_TO_DIFFERENT_MIN_PULSE_WIDTH_BY_ANOTHER_TASK_1_PER_DEV` |
| [:2163](../api_names.txt#L2163) | `DAQmxErrors.PROG_FILTER_CLK_CFGD_TO_DIFFERENT_MIN_PULSE_WIDTH_BY_SAME_TASK_1_PER_DEV` |
| [:2505](../api_names.txt#L2505) | `DAQmxErrors.TERM_CFGD_TO_DIFFERENT_MIN_PULSE_WIDTH_BY_ANOTHER_PROPERTY` |
| [:2506](../api_names.txt#L2506) | `DAQmxErrors.TERM_CFGD_TO_DIFFERENT_MIN_PULSE_WIDTH_BY_ANOTHER_TASK` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul><li>Add <code>CFGD</code> to the Python DAQmx approved terminology.</li></ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>CFG</code> is already widely used throughout the API as a standalone token: 153 names contain it, spanning enum types (<code>_TermCfg</code>, <code>SensorPowerCfg</code>), ~34 error codes, 7 <code>Timing.cfg_*</code> methods and their parameters, ~20 channel properties (e.g. <code>ai_term_cfg</code>, <code>ci_*_term_cfg</code>), 11 trigger <code>cfg_*</code> methods, and 3 watchdog <code>cfg_*</code> methods.<br><br><code>CFGD</code> appears in 6 error codes as the past-participial form of <em>configure</em> (e.g. <code>ALREADY_CFGD</code>, <code>TERM_CFGD_TO_…</code>). The relationship between <em>configure</em> and <em>configured</em> is one of inflectional morphology — specifically, <em>configured</em> is the past participle of the verb <em>configure</em>. Given that <code>CFG</code> is already an established token in the API, <code>CFGD</code> is a natural and recognisable participial abbreviation for <em>configured</em>.</td></tr>
</table>

## `CLKS`

| Line | Content |
| ---: | ------- |
| [:1196](../api_names.txt#L1196) | `DAQmxErrors.CO_MULTIPLE_WRITES_BETWEEN_SAMP_CLKS` |
| [:1878](../api_names.txt#L1878) | `DAQmxErrors.MULTIPLE_WRITES_BETWEEN_SAMP_CLKS` |
| [:2607](../api_names.txt#L2607) | `DAQmxErrors.WAIT_FOR_NEXT_SAMP_CLK_DETECTED_3_OR_MORE_SAMP_CLKS` |
| [:2610](../api_names.txt#L2610) | `DAQmxErrors.WAIT_FOR_NEXT_SAMPLE_CLOCK_OR_READ_DETECTED_3_OR_MORE_MISSED_SAMP_CLKS` |
| [:2684](../api_names.txt#L2684) | `DAQmxWarnings.MULTIPLE_WRITES_BETWEEN_SAMP_CLKS` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul><li>Add <code>CLKS</code> to the Python DAQmx approved terminology.</li></ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>CLK</code> is already in the approved DAQmx abbreviations list as <code>Clk</code> (Clock: Clk). <code>CLKS</code> is simply its plural inflection — the relationship between <em>clock</em> and <em>clocks</em> is regular inflectional morphology (number). Approving the plural form is a natural and minimal extension of the existing approved abbreviation.</td></tr>
</table>

## `COEF`

| Line | Content |
| ---: | ------- |
| [:1014](../api_names.txt#L1014) | `DAQmxErrors.CAL_CHAN_FORWARD_POLY_COEF_NOT_SPECD` |
| [:1015](../api_names.txt#L1015) | `DAQmxErrors.CAL_CHAN_REVERSE_POLY_COEF_NOT_SPECD` |
| [:1490](../api_names.txt#L1490) | `DAQmxErrors.FORWARD_POLYNOMIAL_COEF_NOT_SPECD` |
| [:2260](../api_names.txt#L2260) | `DAQmxErrors.REVERSE_POLYNOMIAL_COEF_NOT_SPECD` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul><li>Add <code>coeff</code>, <code>coeffs</code>, <code>COEFF</code>, and <code>COEFFS</code> to the Python DAQmx approved terminology as the standard singular and plural abbreviations for <em>coefficient</em> and <em>coefficients</em>.</li><li>Deprecate <code>DAQmxErrors.CAL_CHAN_FORWARD_POLY_COEF_NOT_SPECD</code> and replace with <code>DAQmxErrors.CAL_CHAN_FORWARD_POLY_COEFF_NOT_SPECD</code>.</li><li>Deprecate <code>DAQmxErrors.CAL_CHAN_REVERSE_POLY_COEF_NOT_SPECD</code> and replace with <code>DAQmxErrors.CAL_CHAN_REVERSE_POLY_COEFF_NOT_SPECD</code>.</li><li>Deprecate <code>DAQmxErrors.FORWARD_POLYNOMIAL_COEF_NOT_SPECD</code> and replace with <code>DAQmxErrors.FORWARD_POLYNOMIAL_COEFF_NOT_SPECD</code>.</li><li>Deprecate <code>DAQmxErrors.REVERSE_POLYNOMIAL_COEF_NOT_SPECD</code> and replace with <code>DAQmxErrors.REVERSE_POLYNOMIAL_COEFF_NOT_SPECD</code>.</li></ul></td></tr>
<tr><td><b>Rationale</b></td><td>The API already uses three forms. Counts across all 41 names containing a coefficient abbreviation:<br><br><ul><li><code>coeff</code> / <code>COEFF</code>: 17 names — channel properties (<em>e.g.</em> <code>ai_bridge_poly_forward_coeff</code>, <code>ao_dev_scaling_coeff</code>) and <code>Scale.poly_*_coeff</code></li><li><code>coeffs</code> / <code>COEFFS</code>: 20 names — error codes (<em>e.g.</em> <code>NO_POLY_SCALE_COEFFS</code>) and method parameters (<code>forward_coeffs</code>, <code>reverse_coeffs</code>)</li><li><code>COEF</code>: 4 names — error codes only, all following the C-API naming convention</li><li><code>coefs</code>: 0 names</li></ul>The <code>coeff</code>/<code>coeffs</code> pair already dominates 37:4 and forms a consistent singular/plural pair by regular inflectional morphology (number). Web search confirms <code>COEFF</code> is used across medical, health, and aerospace engineering contexts, and <code>COEF</code> leads in construction/architecture — a domain less relevant to DAQmx. Standardising on <code>coeff</code>/<code>coeffs</code> eliminates the inconsistency within the Python API while matching the forms already in wide use.</td></tr>
</table>

## `coeff`

| Line | Content |
| ---: | ------- |
| [:3264](../api_names.txt#L3264) | `AIChannel.ai_bridge_poly_forward_coeff` |
| [:3265](../api_names.txt#L3265) | `AIChannel.ai_bridge_poly_reverse_coeff` |
| [:3299](../api_names.txt#L3299) | `AIChannel.ai_dev_scaling_coeff` |
| [:3302](../api_names.txt#L3302) | `AIChannel.ai_dig_fltr_coeff` |
| [:3426](../api_names.txt#L3426) | `AIChannel.pwr_current_dev_scaling_coeff` |
| [:3432](../api_names.txt#L3432) | `AIChannel.pwr_voltage_dev_scaling_coeff` |
| [:3450](../api_names.txt#L3450) | `AOChannel.ao_dev_scaling_coeff` |
| [:5411](../api_names.txt#L5411) | `PhysicalChannel.ao_power_amp_scaling_coeff` |
| [:5492](../api_names.txt#L5492) | `Scale.calculate_reverse_poly_coeff` |
| [:5503](../api_names.txt#L5503) | `Scale.calculate_reverse_poly_coeff(forward_coeffs)` |
| [:5504](../api_names.txt#L5504) | `Scale.calculate_reverse_poly_coeff(grpc_options)` |
| [:5505](../api_names.txt#L5505) | `Scale.calculate_reverse_poly_coeff(max_val_x)` |
| [:5506](../api_names.txt#L5506) | `Scale.calculate_reverse_poly_coeff(min_val_x)` |
| [:5507](../api_names.txt#L5507) | `Scale.calculate_reverse_poly_coeff(num_points_to_compute)` |
| [:5508](../api_names.txt#L5508) | `Scale.calculate_reverse_poly_coeff(reverse_poly_order)` |
| [:5553](../api_names.txt#L5553) | `Scale.poly_forward_coeff` |
| [:5554](../api_names.txt#L5554) | `Scale.poly_reverse_coeff` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td>See <a href="#coef"><code>COEF</code></a> above.</td></tr>
</table>

## `COEFFS`

| Line | Content |
| ---: | ------- |
| [:1802](../api_names.txt#L1802) | `DAQmxErrors.M_STUDIO_NO_FORWARD_POLY_SCALE_COEFFS` |
| [:1803](../api_names.txt#L1803) | `DAQmxErrors.M_STUDIO_NO_FORWARD_POLY_SCALE_COEFFS_USE_CALC` |
| [:1804](../api_names.txt#L1804) | `DAQmxErrors.M_STUDIO_NO_POLY_SCALE_COEFFS_USE_CALC` |
| [:1805](../api_names.txt#L1805) | `DAQmxErrors.M_STUDIO_NO_REVERSE_POLY_SCALE_COEFFS` |
| [:1806](../api_names.txt#L1806) | `DAQmxErrors.M_STUDIO_NO_REVERSE_POLY_SCALE_COEFFS_USE_CALC` |
| [:1926](../api_names.txt#L1926) | `DAQmxErrors.NO_FORWARD_POLY_SCALE_COEFFS` |
| [:1937](../api_names.txt#L1937) | `DAQmxErrors.NO_POLY_SCALE_COEFFS` |
| [:1940](../api_names.txt#L1940) | `DAQmxErrors.NO_REVERSE_POLY_SCALE_COEFFS` |
| [:2140](../api_names.txt#L2140) | `DAQmxErrors.POLY_COEFFS_INCONSISTENT` |
| [:2655](../api_names.txt#L2655) | `DAQmxErrors.ZERO_FORWARD_POLY_SCALE_COEFFS` |
| [:2656](../api_names.txt#L2656) | `DAQmxErrors.ZERO_REVERSE_POLY_SCALE_COEFFS` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td>See <a href="#coef"><code>COEF</code></a> above.</td></tr>
</table>

## `coeffs`

| Line | Content |
| ---: | ------- |
| [:3985](../api_names.txt#L3985) | `AIChannelCollection.add_ai_force_bridge_polynomial_chan(forward_coeffs)` |
| [:3992](../api_names.txt#L3992) | `AIChannelCollection.add_ai_force_bridge_polynomial_chan(reverse_coeffs)` |
| [:4094](../api_names.txt#L4094) | `AIChannelCollection.add_ai_pressure_bridge_polynomial_chan(forward_coeffs)` |
| [:4101](../api_names.txt#L4101) | `AIChannelCollection.add_ai_pressure_bridge_polynomial_chan(reverse_coeffs)` |
| [:4220](../api_names.txt#L4220) | `AIChannelCollection.add_ai_torque_bridge_polynomial_chan(forward_coeffs)` |
| [:4227](../api_names.txt#L4227) | `AIChannelCollection.add_ai_torque_bridge_polynomial_chan(reverse_coeffs)` |
| [:5503](../api_names.txt#L5503) | `Scale.calculate_reverse_poly_coeff(forward_coeffs)` |
| [:5523](../api_names.txt#L5523) | `Scale.create_polynomial_scale(forward_coeffs)` |
| [:5526](../api_names.txt#L5526) | `Scale.create_polynomial_scale(reverse_coeffs)` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td>See <a href="#coef"><code>COEF</code></a> above.</td></tr>
</table>

## `CONV`

| Line | Content |
| ---: | ------- |
| [:923](../api_names.txt#L923) | `DAQmxErrors.AI_CONV_RATE_TOO_HIGH` |
| [:1010](../api_names.txt#L1010) | `DAQmxErrors.CABLED_MODULE_CANNOT_ROUTE_CONV_CLK` |
| [:1295](../api_names.txt#L1295) | `DAQmxErrors.DELAY_FROM_SAMP_CLK_WITH_EXT_CONV` |
| [:2665](../api_names.txt#L2665) | `DAQmxWarnings.AI_CONV_RATE_TOO_LOW` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul><li>Add <code>CONV</code> and <code>conv</code> to the Python DAQmx approved terminology as the abbreviation for <em>conversion</em> in the AI conversion clock context.</li></ul></td></tr>
<tr><td><b>Rationale</b></td><td>Web search for <em>conversion</em>, <em>convert</em>, and <em>converter</em> shows three candidates in the computing/electronics space:<br><br><ul><li><code>CNV</code> — formally listed abbreviation for <em>conversion</em> (US Government, NASA, Military, IT) and <em>convert</em> (Assembly)</li><li><code>CONV</code> — formally listed abbreviation for <em>converter</em> (NASA, aircraft/aviation); also suggested as a nearby abbreviation for <em>conversion</em> and <em>convert</em></li><li><code>CVT</code> — listed for <em>converter</em> in IT contexts</li></ul>Despite <code>CNV</code> having stronger formal backing for <em>conversion</em>, <code>CNV</code> does not appear anywhere in the API (0 matches). <code>CONV</code>/<code>conv</code> is already established throughout: 4 error/warning codes (<code>AI_CONV_RATE_TOO_HIGH</code>, <code>CABLED_MODULE_CANNOT_ROUTE_CONV_CLK</code>, <code>DELAY_FROM_SAMP_CLK_WITH_EXT_CONV</code>, <code>AI_CONV_RATE_TOO_LOW</code>) and 5 properties (<code>ai_conv_clk_output_term</code>, <code>ai_conv_clk_pulse_polarity</code>, <code>ai_conv_active_edge</code>, <code>ai_conv_dig_fltr_enable</code>, <code>ai_conv_dig_fltr_min_pulse_width</code>). All 9 uses refer to the analog input conversion process (the ADC conversion clock). Adopting <code>CONV</code>/<code>conv</code> formalises existing usage and avoids introducing an inconsistency with an abbreviation that has no precedent in the API.</td></tr>
</table>

## `conv`

| Line | Content |
| ---: | ------- |
| [:3001](../api_names.txt#L3001) | `ExportSignals.ai_conv_clk_output_term` |
| [:3002](../api_names.txt#L3002) | `ExportSignals.ai_conv_clk_pulse_polarity` |
| [:3155](../api_names.txt#L3155) | `Timing.ai_conv_active_edge` |
| [:3156](../api_names.txt#L3156) | `Timing.ai_conv_dig_fltr_enable` |
| [:3157](../api_names.txt#L3157) | `Timing.ai_conv_dig_fltr_min_pulse_width` |
| [:3158](../api_names.txt#L3158) | `Timing.ai_conv_dig_fltr_timebase_rate` |
| [:3159](../api_names.txt#L3159) | `Timing.ai_conv_dig_fltr_timebase_src` |
| [:3160](../api_names.txt#L3160) | `Timing.ai_conv_dig_sync_enable` |
| [:3161](../api_names.txt#L3161) | `Timing.ai_conv_max_rate` |
| [:3162](../api_names.txt#L3162) | `Timing.ai_conv_rate` |
| [:3163](../api_names.txt#L3163) | `Timing.ai_conv_src` |
| [:3164](../api_names.txt#L3164) | `Timing.ai_conv_timebase_div` |
| [:3165](../api_names.txt#L3165) | `Timing.ai_conv_timebase_src` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td>See <a href="#conv"><code>CONV</code></a> above.</td></tr>
</table>

## `COULDNT`

| Line | Content |
| ---: | ------- |
| [:1477](../api_names.txt#L1477) | `DAQmxErrors.FIRMWARE_COULDNT_UPDATE` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul><li>Deprecate <code>DAQmxErrors.FIRMWARE_COULDNT_UPDATE</code> and replace with <code>DAQmxErrors.FIRMWARE_COULD_NOT_UPDATE</code>.</li></ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>COULDNT</code> is a contracted form of <em>could not</em> with the apostrophe dropped. Contractions are informal register and out of place in identifier names. Spelling it out as <code>COULD_NOT</code> is more readable — the underscore-separated tokens <code>COULD</code> and <code>NOT</code> are each ordinary English words that pass spell check without any dictionary exemption, whereas <code>COULDNT</code> requires an explicit exemption. cspell flags <code>COULDNT</code> precisely because, without the apostrophe, it is not a recognised word.</td></tr>
</table>

## `CTRS`

| Line | Content |
| ---: | ------- |
| [:2641](../api_names.txt#L2641) | `DAQmxErrors.WRITE_FAILED_MULTIPLE_CTRS_WITH_FREQOUT` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul><li>Add <code>CTRS</code> to the Python DAQmx approved terminology.</li></ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>Ctr</code> (Counter) is already in the approved DAQmx abbreviations list. <code>CTRS</code> is its regular plural inflection — the same relationship as <code>CLK</code>/<code>CLKS</code> above. Approving the plural is a minimal and consistent extension of the existing approval.</td></tr>
</table>

## `DIFFT`

| Line | Content |
| ---: | ------- |
| [:1353](../api_names.txt#L1353) | `DAQmxErrors.DIFFT_AI_INPUT_SRC_IN_ONE_CHAN_GROUP` |
| [:1354](../api_names.txt#L1354) | `DAQmxErrors.DIFFT_INTERNAL_AI_INPUT_SRCS` |
| [:1355](../api_names.txt#L1355) | `DAQmxErrors.DIFFT_SYNC_PULSE_SRC_AND_SAMP_CLK_TIMEBASE_SRC_DEV_MULTI_DEV_TASK` |
| [:1505](../api_names.txt#L1505) | `DAQmxErrors.GET_ACTIVE_DEV_PRPTY_FAILED_DUE_TO_DIFFT_VALS` |
| [:2184](../api_names.txt#L2184) | `DAQmxErrors.PRPTY_GET_IMPLIED_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS` |
| [:2185](../api_names.txt#L2185) | `DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS` |
| [:2186](../api_names.txt#L2186) | `DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFT_VALUES` |
| [:2187](../api_names.txt#L2187) | `DAQmxErrors.PRPTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul>
<li>Deprecate all 8 <code>DIFFT_*</code> / <code>*_DIFFT_*</code> names and replace with their <code>DIFFERENT</code> equivalents:</li>
<ul>
<li><code>DAQmxErrors.DIFFT_AI_INPUT_SRC_IN_ONE_CHAN_GROUP</code> → <code>DAQmxErrors.DIFFERENT_AI_INPUT_SRC_IN_ONE_CHAN_GROUP</code></li>
<li><code>DAQmxErrors.DIFFT_INTERNAL_AI_INPUT_SRCS</code> → <code>DAQmxErrors.DIFFERENT_INTERNAL_AI_INPUT_SRCS</code></li>
<li><code>DAQmxErrors.DIFFT_SYNC_PULSE_SRC_AND_SAMP_CLK_TIMEBASE_SRC_DEV_MULTI_DEV_TASK</code> → <code>DAQmxErrors.DIFFERENT_SYNC_PULSE_SRC_AND_SAMP_CLK_TIMEBASE_SRC_DEV_MULTI_DEV_TASK</code></li>
<li><code>DAQmxErrors.GET_ACTIVE_DEV_PRPTY_FAILED_DUE_TO_DIFFT_VALS</code> → <code>DAQmxErrors.GET_ACTIVE_DEV_PRPTY_FAILED_DUE_TO_DIFFERENT_VALS</code></li>
<li><code>DAQmxErrors.PRPTY_GET_IMPLIED_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code> → <code>DAQmxErrors.PRPTY_GET_IMPLIED_ACTIVE_CHAN_FAILED_DUE_TO_DIFFERENT_VALS</code></li>
<li><code>DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code> → <code>DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFERENT_VALS</code></li>
<li><code>DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFT_VALUES</code> → <code>DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFERENT_VALUES</code></li>
<li><code>DAQmxErrors.PRPTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code> → <code>DAQmxErrors.PRPTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFERENT_VALS</code></li>
</ul>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>
All 8 <code>DIFFT</code> occurrences mean <em>different</em>. The full word <code>DIFFERENT</code> already appears 18 times in the API (18:8 in favour of the full word), and three of the <code>DIFFT_*</code> names have a direct <code>DIFFERENT_*</code> parallel already present in the API:<br><br>
<ul>
<li><code>DIFFT_AI_INPUT_SRC_IN_ONE_CHAN_GROUP</code> (L1353) alongside <code>DIFFERENT_AI_INPUT_SRC_IN_ONE_CHAN_GROUP</code> (L1346)</li>
<li><code>DIFFT_INTERNAL_AI_INPUT_SRCS</code> (L1354) alongside <code>DIFFERENT_INTERNAL_AI_INPUT_SOURCES</code> (L1349)</li>
<li><code>DIFFT_SYNC_PULSE_SRC_…</code> (L1355) — no exact parallel, but the pattern is the same</li>
</ul>
These duplicate pairs are strong evidence that the <code>DIFFT_*</code> names are legacy C-API aliases not cleaned up when the Python API was created.<br><br>
There is also a readability hazard: <code>DIFF</code> (without the <code>T</code>) is already an established token in the API meaning <em>differential</em> — it appears in <code>PSEUDO_DIFF</code> and <code>TERM_CFG_DIFF</code>. A reader encountering <code>DIFFT</code> may parse it as <code>DIFF</code> + <code>T</code> rather than as an abbreviation for <em>different</em>, creating ambiguity between two unrelated concepts.<br><br>
Unlike <em>differential</em> (12 characters), <em>different</em> (9 characters) is short enough that no abbreviation is warranted — the full word is both unambiguous and already the dominant form in the API.
</td></tr>
</table>

## `DOESNT`

| Line | Content |
| ---: | ------- |
| [:1772](../api_names.txt#L1772) | `DAQmxErrors.LAB_VIEW_VERSION_DOESNT_SUPPORT_DA_QMX_EVENTS` |
| [:2317](../api_names.txt#L2317) | `DAQmxErrors.SAMP_CLK_RATE_DOESNT_MATCH_SAMP_CLK_SRC` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul>
<li>Deprecate <code>DAQmxErrors.LAB_VIEW_VERSION_DOESNT_SUPPORT_DA_QMX_EVENTS</code> and replace with <code>DAQmxErrors.LAB_VIEW_VERSION_DOES_NOT_SUPPORT_DA_QMX_EVENTS</code>.</li>
<li>Deprecate <code>DAQmxErrors.SAMP_CLK_RATE_DOESNT_MATCH_SAMP_CLK_SRC</code> and replace with <code>DAQmxErrors.SAMP_CLK_RATE_DOES_NOT_MATCH_SAMP_CLK_SRC</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>DOESNT</code> is a contracted form of <em>does not</em> with the apostrophe dropped. Contractions are informal register and out of place in identifier names. The full form <code>DOES_NOT</code> already dominates with 35 uses in the API vs 2 for <code>DOESNT</code>. As with <code>COULDNT</code>, spelling out the contraction means each token (<code>DOES</code>, <code>NOT</code>) is an ordinary English word requiring no spell-check exemption.</td></tr>
</table>

## `DONT`

| Line | Content |
| ---: | ------- |
| [:613](../api_names.txt#L613) | `RegenerationMode.DONT_ALLOW_REGENERATION` |
| [:1160](../api_names.txt#L1160) | `DAQmxErrors.CHANGE_DETECTION_RISING_AND_FALLING_EDGE_CHAN_DONT_MATCH` |
| [:1380](../api_names.txt#L1380) | `DAQmxErrors.DONT_MIX_SYNC_PULSE_AND_SAMP_CLK_TIMEBASE_ON_449_X` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul>
<li>Deprecate <code>RegenerationMode.DONT_ALLOW_REGENERATION</code> and replace with <code>RegenerationMode.DO_NOT_ALLOW_REGENERATION</code>.</li>
<li>Deprecate <code>DAQmxErrors.CHANGE_DETECTION_RISING_AND_FALLING_EDGE_CHAN_DONT_MATCH</code> and replace with <code>DAQmxErrors.CHANGE_DETECTION_RISING_AND_FALLING_EDGE_CHAN_DO_NOT_MATCH</code>.</li>
<li>Deprecate <code>DAQmxErrors.DONT_MIX_SYNC_PULSE_AND_SAMP_CLK_TIMEBASE_ON_449_X</code> and replace with <code>DAQmxErrors.DO_NOT_MIX_SYNC_PULSE_AND_SAMP_CLK_TIMEBASE_ON_449_X</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>DONT</code> is a contracted form of <em>do not</em> with the apostrophe dropped. Same rationale as <code>DOESNT</code> and <code>COULDNT</code>: contractions are informal, each dropped apostrophe produces an unrecognised word, and spelling out <code>DO_NOT</code> keeps every token a plain dictionary word with no exemption needed. While <code>DO_NOT</code> has no existing uses in the API (vs <code>DOES_NOT</code>'s 35), the two forms are grammatically parallel and the same policy should apply consistently. Note that <code>DONT_ALLOW_REGENERATION</code> is an enum member, not only an error code — the deprecation applies equally.</td></tr>
</table>

## `DSTAR`

| Line | Content |
| ---: | ------- |
| [:2276](../api_names.txt#L2276) | `DAQmxErrors.ROUTING_DEST_TERM_PXI_DSTAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING` |
| [:2277](../api_names.txt#L2277) | `DAQmxErrors.ROUTING_DEST_TERM_PXI_DSTAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING` |
| [:2296](../api_names.txt#L2296) | `DAQmxErrors.ROUTING_SRC_TERM_PXI_DSTAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING` |
| [:2297](../api_names.txt#L2297) | `DAQmxErrors.ROUTING_SRC_TERM_PXI_DSTAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul>
<li>Deprecate <code>DAQmxErrors.ROUTING_DEST_TERM_PXI_DSTAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING</code> and replace with <code>DAQmxErrors.ROUTING_DEST_TERM_PXI_D_STAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING</code>.</li>
<li>Deprecate <code>DAQmxErrors.ROUTING_DEST_TERM_PXI_DSTAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING</code> and replace with <code>DAQmxErrors.ROUTING_DEST_TERM_PXI_D_STAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING</code>.</li>
<li>Deprecate <code>DAQmxErrors.ROUTING_SRC_TERM_PXI_DSTAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING</code> and replace with <code>DAQmxErrors.ROUTING_SRC_TERM_PXI_D_STAR_IN_NON_D_STAR_TRIGGER_SLOT_ROUTING</code>.</li>
<li>Deprecate <code>DAQmxErrors.ROUTING_SRC_TERM_PXI_DSTAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING</code> and replace with <code>DAQmxErrors.ROUTING_SRC_TERM_PXI_D_STAR_X_NOT_IN_SYSTEM_TIMING_SLOT_ROUTING</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>
<em>D*</em> (Differential Star) is the PXIe differential star trigger bus — a hardware feature of the PXI Express backplane. It is a compound of two elements: <em>D</em> for <em>differential</em> (the signal type) and <em>star</em> for the star topology (shared with the ordinary PXI star trigger bus, <em>PXI_Star</em>). It is therefore not an opaque abbreviation but a transparent compound, and the natural Python token is <code>D_STAR</code>, separating the two elements with an underscore in the same way the platform name itself is rendered.<br><br>
The API already uses <code>STAR</code> (not a shorter abbreviation) for the ordinary PXI star trigger bus throughout — 22 names in the <code>ROUTING_DEST_TERM_PXI_STAR_*</code> and <code>ROUTING_SRC_TERM_PXI_STAR_*</code> families. <code>PXI_D_STAR</code> is the direct parallel: it adds only the <code>D_</code> prefix to the existing <code>PXI_STAR</code> pattern.<br><br>
Most critically, two of the four <code>DSTAR</code> names already contain <code>D_STAR</code> in their own descriptive suffix:
<ul>
<li><code>ROUTING_DEST_TERM_PXI_<b>DSTAR</b>_IN_NON_<b>D_STAR</b>_TRIGGER_SLOT_ROUTING</code></li>
<li><code>ROUTING_SRC_TERM_PXI_<b>DSTAR</b>_IN_NON_<b>D_STAR</b>_TRIGGER_SLOT_ROUTING</code></li>
</ul>
Each of these names uses two different spellings for the same hardware feature within a single identifier — an internal inconsistency that the rename resolves.
</td></tr>
</table>

## `ELEC`

| Line | Content |
| ---: | ------- |
| [:1846](../api_names.txt#L1846) | `DAQmxErrors.MISMATCHED_ELEC_PHYS_VALUES` |
| [:2496](../api_names.txt#L2496) | `DAQmxErrors.TEDS_MIN_ELEC_VAL_GE_MAX_ELEC_VAL` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul>
<li>Retain <code>DAQmxErrors.MISMATCHED_ELEC_PHYS_VALUES</code> and <code>DAQmxErrors.TEDS_MIN_ELEC_VAL_GE_MAX_ELEC_VAL</code> unchanged.</li>
<li>Add these two full error code names (<code>MISMATCHED_ELEC_PHYS_VALUES</code> and <code>TEDS_MIN_ELEC_VAL_GE_MAX_ELEC_VAL</code>) as entries in <code>daqmx-python-api-elements.txt</code>, rather than adding <code>ELEC</code> to the approved abbreviations list.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>
In this context <code>ELEC</code> means <em>electrical</em> — the raw sensor signal domain (e.g. millivolts) as opposed to the physical/engineering units domain after scaling. The two names form a natural <code>ELEC</code>/<code>PHYS</code> pair:<br><br>
<ul>
<li><code>MISMATCHED_ELEC_PHYS_VALUES</code></li>
<li><code>TEDS_MIN_ELEC_VAL_GE_MAX_ELEC_VAL</code> alongside <code>TEDS_MIN_PHYS_VAL_GE_MAX_PHYS_VAL</code></li>
</ul>
Renaming <code>ELEC</code> to <code>ELECTRICAL</code> without also renaming <code>PHYS</code> to <code>PHYSICAL</code> would break that symmetry — producing names like <code>MISMATCHED_ELECTRICAL_PHYS_VALUES</code> which pair a full word with an abbreviation. Renaming <code>PHYS</code> too to achieve parity is disproportionate: <code>PHYS</code> occurs 46 times across the API and is not flagged by cspell (it is a recognised dictionary word), so there is no pressing reason to change it.<br><br>
Formally approving <code>ELEC</code> as a general abbreviation would invite future use in unrelated contexts (electronics, electrical engineering, election, …) where <em>electrical</em> is not the intended meaning. Adding the two full names to the dictionary instead suppresses the flag for these names only: cspell matches dictionary entries against the raw source text before tokenising, so a full entry like <code>MISMATCHED_ELEC_PHYS_VALUES</code> prevents <code>ELEC</code> from being flagged within that name, while leaving <code>ELEC</code> unapproved everywhere else so any future use is still caught.
</td></tr>
</table>

## `ethernet`

| Line | Content |
| ---: | ------- |
| [:5386](../api_names.txt#L5386) | `Device.tcpip_ethernet_ip` |

<table border="1" cellpadding="6" cellspacing="0">
<tr><td><b>Recommendations</b></td><td><ul>
<li>Add <code>ethernet</code> to <code>daqmx-python-api-elements.txt</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>
<em>Ethernet</em> is a standard English word (the IEEE 802.3 wired networking standard) and is present in cspell's built-in dictionary — but only with an initial capital, as <code>Ethernet</code> (it is a proper noun / trademark). The <code>api_names.txt</code> override uses <code>caseSensitive: true</code>, which prevents the built-in capitalised entry from matching the lowercase token <code>ethernet</code> that appears in the snake_case property name <code>Device.tcpip_ethernet_ip</code>.<br><br>
Because lowercase is the correct and only form for Python snake_case identifiers, the right fix is not to change the name but to add <code>ethernet</code> (lowercase) to the project dictionary. This is not approving a new abbreviation — <em>ethernet</em> is simply the snake_case rendition of a well-known, unambiguous word.
</td></tr>
</table>

## `FREQOUT`

| Line | Content |
| ---: | ------- |
| [:1491](../api_names.txt#L1491) | `DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY` |
| [:1492](../api_names.txt#L1492) | `DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_2` |
| [:1493](../api_names.txt#L1493) | `DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_3` |
| [:1599](../api_names.txt#L1599) | `DAQmxErrors.INVALID_ACQ_TYPE_FOR_FREQOUT` |
| [:2641](../api_names.txt#L2641) | `DAQmxErrors.WRITE_FAILED_MULTIPLE_CTRS_WITH_FREQOUT` |

<table>
<tr><td><strong>Recommendation</strong></td><td><ul>
<li>Deprecate <code>DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY</code> and replace with <code>DAQmxErrors.FREQ_OUT_CANNOT_PRODUCE_DESIRED_FREQUENCY</code>.</li>
<li>Deprecate <code>DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_2</code> and replace with <code>DAQmxErrors.FREQ_OUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_2</code>.</li>
<li>Deprecate <code>DAQmxErrors.FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_3</code> and replace with <code>DAQmxErrors.FREQ_OUT_CANNOT_PRODUCE_DESIRED_FREQUENCY_3</code>.</li>
<li>Deprecate <code>DAQmxErrors.INVALID_ACQ_TYPE_FOR_FREQOUT</code> and replace with <code>DAQmxErrors.INVALID_ACQ_TYPE_FOR_FREQ_OUT</code>.</li>
<li>Deprecate <code>DAQmxErrors.WRITE_FAILED_MULTIPLE_CTRS_WITH_FREQOUT</code> and replace with <code>DAQmxErrors.WRITE_FAILED_MULTIPLE_CTRS_WITH_FREQ_OUT</code>.</li>
</ul></td></tr>
<tr><td><strong>Rationale</strong></td>
<td>
The physical 68-pin connector diagrams for NI E-series boards (NI 6020E, 6023E, 6024E, 6025E, etc.) label the pin <code>FREQ OUT</code> (two words, space-separated) — not as the single token <code>FREQOUT</code>. The Traditional NI-DAQ&nbsp;(Legacy) programming interface likewise used <code>FREQ_OUT</code> (underscore-separated) for this terminal, and the NI-DAQmx Device Terminals documentation maps it to <code>FREQ OUT</code> / <code>F OUT</code>. <code>FREQOUT</code> is therefore not an established hardware label; it is an abbreviation that drops the separator entirely.<br><br>
The consistent and correct form is <code>FREQ_OUT</code>, matching the Traditional NI-DAQ signal name and the general underscore-as-separator convention used throughout the rest of the error code identifiers. All five names should be renamed:
<ul>
<li><code>FREQOUT_CANNOT_PRODUCE_DESIRED_FREQUENCY</code> → <code>FREQ_OUT_CANNOT_PRODUCE_DESIRED_FREQUENCY</code> (×3 variants)</li>
<li><code>INVALID_ACQ_TYPE_FOR_FREQOUT</code> → <code>INVALID_ACQ_TYPE_FOR_FREQ_OUT</code></li>
<li><code>WRITE_FAILED_MULTIPLE_CTRS_WITH_FREQOUT</code> → <code>WRITE_FAILED_MULTIPLE_CTRS_WITH_FREQ_OUT</code></li>
</ul>
</td></tr>
</table>

## `hshk`

| Line | Content |
| ---: | ------- |
| [:3016](../api_names.txt#L3016) | `ExportSignals.hshk_event_delay` |
| [:3017](../api_names.txt#L3017) | `ExportSignals.hshk_event_interlocked_assert_on_start` |
| [:3018](../api_names.txt#L3018) | `ExportSignals.hshk_event_interlocked_asserted_lvl` |
| [:3019](../api_names.txt#L3019) | `ExportSignals.hshk_event_interlocked_deassert_delay` |
| [:3020](../api_names.txt#L3020) | `ExportSignals.hshk_event_output_behavior` |
| [:3021](../api_names.txt#L3021) | `ExportSignals.hshk_event_output_term` |
| [:3022](../api_names.txt#L3022) | `ExportSignals.hshk_event_pulse_polarity` |
| [:3023](../api_names.txt#L3023) | `ExportSignals.hshk_event_pulse_width` |
| [:3177](../api_names.txt#L3177) | `Timing.hshk_delay_after_xfer` |
| [:3178](../api_names.txt#L3178) | `Timing.hshk_sample_input_data_when` |
| [:3179](../api_names.txt#L3179) | `Timing.hshk_start_cond` |

<table>
<tr><td><strong>Recommendation</strong></td><td><ul>
<li>Deprecate <code>ExportSignals.hshk_event_delay</code> and replace with <code>ExportSignals.handshaking_event_delay</code>.</li>
<li>Deprecate <code>ExportSignals.hshk_event_interlocked_assert_on_start</code> and replace with <code>ExportSignals.handshaking_event_interlocked_assert_on_start</code>.</li>
<li>Deprecate <code>ExportSignals.hshk_event_interlocked_asserted_lvl</code> and replace with <code>ExportSignals.handshaking_event_interlocked_asserted_lvl</code>.</li>
<li>Deprecate <code>ExportSignals.hshk_event_interlocked_deassert_delay</code> and replace with <code>ExportSignals.handshaking_event_interlocked_deassert_delay</code>.</li>
<li>Deprecate <code>ExportSignals.hshk_event_output_behavior</code> and replace with <code>ExportSignals.handshaking_event_output_behavior</code>.</li>
<li>Deprecate <code>ExportSignals.hshk_event_output_term</code> and replace with <code>ExportSignals.handshaking_event_output_term</code>.</li>
<li>Deprecate <code>ExportSignals.hshk_event_pulse_polarity</code> and replace with <code>ExportSignals.handshaking_event_pulse_polarity</code>.</li>
<li>Deprecate <code>ExportSignals.hshk_event_pulse_width</code> and replace with <code>ExportSignals.handshaking_event_pulse_width</code>.</li>
<li>Deprecate <code>Timing.hshk_delay_after_xfer</code> and replace with <code>Timing.handshaking_delay_after_xfer</code>.</li>
<li>Deprecate <code>Timing.hshk_sample_input_data_when</code> and replace with <code>Timing.handshaking_sample_input_data_when</code>.</li>
<li>Deprecate <code>Timing.hshk_start_cond</code> and replace with <code>Timing.handshaking_start_cond</code>.</li>
</ul></td></tr>
<tr><td><strong>Rationale</strong></td><td>The approved DAQmx abbreviations list specifies <code>Handshaking: Handshaking</code> — meaning the full word is required and no abbreviation is approved. All other <code>Timing.cfg_*handshaking*</code> methods in the same class already use the full word. <code>hshk</code> is an inconsistent and unapproved shortening.</td></tr>
</table>

## `HWTSP`

| Line | Content |
| ---: | ------- |
| [:976](../api_names.txt#L976) | `DAQmxErrors.ATTRIBUTE_NOT_SUPPORTED_UNLESS_HWTSP` |
| [:983](../api_names.txt#L983) | `DAQmxErrors.AVERAGING_WHEN_NOT_INTERNAL_HWTSP` |
| [:1296](../api_names.txt#L1296) | `DAQmxErrors.DELAY_FROM_SAMPLE_CLOCK_OUT_OF_RANGE_FOR_HWTSP` |
| [:1322](../api_names.txt#L1322) | `DAQmxErrors.DEVICE_DOES_NOT_SUPPORT_HWTSP` |
| [:1527](../api_names.txt#L1527) | `DAQmxErrors.HWTSP_MULTI_SAMPLE_WRITE` |
| [:2194](../api_names.txt#L2194) | `DAQmxErrors.RATE_TOO_FAST_FOR_HWTSP` |

<table>
<tr><td><strong>Recommendation</strong></td><td><ul>
<li>Deprecate <code>DAQmxErrors.ATTRIBUTE_NOT_SUPPORTED_UNLESS_HWTSP</code> and replace with <code>DAQmxErrors.ATTRIBUTE_NOT_SUPPORTED_UNLESS_HW_TIMED_SINGLE_POINT</code>.</li>
<li>Deprecate <code>DAQmxErrors.AVERAGING_WHEN_NOT_INTERNAL_HWTSP</code> and replace with <code>DAQmxErrors.AVERAGING_WHEN_NOT_INTERNAL_HW_TIMED_SINGLE_POINT</code>.</li>
<li>Deprecate <code>DAQmxErrors.DELAY_FROM_SAMPLE_CLOCK_OUT_OF_RANGE_FOR_HWTSP</code> and replace with <code>DAQmxErrors.DELAY_FROM_SAMPLE_CLOCK_OUT_OF_RANGE_FOR_HW_TIMED_SINGLE_POINT</code>.</li>
<li>Deprecate <code>DAQmxErrors.DEVICE_DOES_NOT_SUPPORT_HWTSP</code> and replace with <code>DAQmxErrors.DEVICE_DOES_NOT_SUPPORT_HW_TIMED_SINGLE_POINT</code>.</li>
<li>Deprecate <code>DAQmxErrors.HWTSP_MULTI_SAMPLE_WRITE</code> and replace with <code>DAQmxErrors.HW_TIMED_SINGLE_POINT_MULTI_SAMPLE_WRITE</code>.</li>
<li>Deprecate <code>DAQmxErrors.RATE_TOO_FAST_FOR_HWTSP</code> and replace with <code>DAQmxErrors.RATE_TOO_FAST_FOR_HW_TIMED_SINGLE_POINT</code>.</li>
</ul>
<p><strong>Additional items</strong> (not flagged by cspell but contain the same unapproved shortenings — fix in the same pass):</p><ul>
<li>Deprecate <code>DAQmxErrors.CANNOT_READ_WHEN_AUTO_START_FALSE_HW_TIMED_SINGLE_PT_AND_TASK_NOT_RUNNING</code> and replace with <code>DAQmxErrors.CANNOT_READ_WHEN_AUTO_START_FALSE_HW_TIMED_SINGLE_POINT_AND_TASK_NOT_RUNNING</code>.</li>
<li>Deprecate <code>DAQmxErrors.CANNOT_WRITE_NOT_STARTED_AUTO_START_FALSE_NOT_ON_DEMAND_HW_TIMED_SGL_PT</code> and replace with <code>DAQmxErrors.CANNOT_WRITE_NOT_STARTED_AUTO_START_FALSE_NOT_ON_DEMAND_HW_TIMED_SINGLE_POINT</code>.</li>
</ul>
</td></tr>
<tr><td><strong>Rationale</strong></td><td>
<code>HWTSP</code> is a compressed initialism for <em>Hardware Timed Single Point</em>. It is not in the approved DAQmx abbreviations list.
The approved form for each component word is: <code>HW</code> (Hardware: HW), <code>Timed</code> (plain English), <code>Single</code> (<code>Single: Single</code> — no abbreviation approved), <code>Point</code> (no entry at all — no abbreviation approved).
The fully expanded form <code>HW_TIMED_SINGLE_POINT</code> is already established in the codebase as <code>SampleTimingType.HW_TIMED_SINGLE_POINT</code>.<br><br>
Two existing error names had already attempted partial expansions but used further unapproved shortenings:
<code>CANNOT_READ_WHEN_AUTO_START_FALSE_HW_TIMED_SINGLE_PT_AND_TASK_NOT_RUNNING</code> uses <code>PT</code> (not approved for Point) and
<code>CANNOT_WRITE_NOT_STARTED_AUTO_START_FALSE_NOT_ON_DEMAND_HW_TIMED_SGL_PT</code> uses both <code>SGL</code> (not approved for Single) and <code>PT</code>.
These are additional violations that should be normalised to <code>HW_TIMED_SINGLE_POINT</code> as part of the same work, even though they are not flagged by cspell (their tokens happen to be suppressed by other dictionary entries).
The longest proposed replacement (<code>DELAY_FROM_SAMPLE_CLOCK_OUT_OF_RANGE_FOR_HW_TIMED_SINGLE_POINT</code>, 63 chars) is well within the existing maximum of 76 chars in the error code file.
</td></tr>
</table>

## `hysts`

| Line | Content |
| ---: | ------- |
| [:4766](../api_names.txt#L4766) | `ReferenceTrigger.anlg_multi_edge_hysts` |
| [:4815](../api_names.txt#L4815) | `StartTrigger.anlg_multi_edge_hysts` |

<table>
<tr><td><strong>Recommendation</strong></td><td><ul>
<li>Deprecate <code>ReferenceTrigger.anlg_multi_edge_hysts</code> and replace with <code>ReferenceTrigger.anlg_multi_edge_hyst</code>.</li>
<li>Deprecate <code>StartTrigger.anlg_multi_edge_hysts</code> and replace with <code>StartTrigger.anlg_multi_edge_hyst</code>.</li>
</ul></td></tr>
<tr><td><strong>Rationale</strong></td><td><code>hysts</code> is not a recognised plural form — <code>hyst</code> is the approved abbreviation for <em>hysteresis</em>, which is already a collective/uncountable noun. The trailing <code>s</code> appears to be an oversight. The parallel properties <code>anlg_multi_edge_slopes</code> and <code>anlg_multi_edge_lvls</code> confirm that array-valued properties in this group use the plural of their element noun, but hysteresis does not pluralise to <em>hysts</em> in standard usage. The correct form is <code>hyst</code>.</td></tr>
</table>



| Line | Content |
| ---: | ------- |
| [:1544](../api_names.txt#L1544) | `DAQmxErrors.IMMED_TRIG_DURING_RIS_MODE` |
| [:1917](../api_names.txt#L1917) | `DAQmxErrors.NO_COMMON_TRIG_LINE_FOR_IMMED_ROUTE` |

## `IRIGB`

| Line | Content |
| ---: | ------- |
| [:497](../api_names.txt#L497) | `GpsSignalType.IRIGB` |

<table>
<tr><td><strong>Recommendation</strong></td><td><ul>
<li>Deprecate <code>GpsSignalType.IRIGB</code> and replace with <code>GpsSignalType.IRIG_B</code>.</li>
</ul></td></tr>
<tr><td><strong>Rationale</strong></td><td>IRIG-B is the Inter-Range Instrumentation Group timecode format B, defined by IRIG Standard 200-16 (U.S. Army Range Commanders Council). The standard name is universally written as <em>IRIG-B</em> (hyphenated) or <em>IRIG B</em> (space-separated) — the Wikipedia article, the NI docstring (<code># Use the IRIG-B synchronization method</code>), and the IRIG standard document itself all use the hyphenated form. The Python underscore equivalent is <code>IRIG_B</code>. The one-word form <code>IRIGB</code> has no authoritative backing: the domain <code>irigb.com</code> (cited by Wikipedia as an external link) resolves to a domain parking page with no content.</td></tr>
</table>

## `ISOC`

| Line | Content |
| ---: | ------- |
| [:2062](../api_names.txt#L2062) | `DAQmxErrors.PAL_ISOC_STREAM_BUFFER_ERROR` |

<table>
<tr><td><strong>Recommendation</strong></td><td>Add <code>ISOC</code> to the dictionary.</td></tr>
<tr><td><strong>Rationale</strong></td><td><code>ISOC</code> is the standard abbreviation for <em>isochronous</em> in USB (Universal Serial Bus) and IEEE 1394 (FireWire) specifications, where <em>isochronous transfer</em> denotes a time-sensitive streaming transfer mode that guarantees bandwidth. The Linux kernel itself uses <code>USB_ENDPOINT_XFER_ISOC</code> as the official constant name for this transfer type. NI's Platform Abstraction Layer (PAL) uses this same abbreviation when surfacing USB bus-layer errors. The error sits between <code>PAL_USB_TRANSACTION_ERROR</code> (−50808) and other PAL bus errors, confirming its bus-transfer origin. Expanding it to <code>ISOCHRONOUS</code> would be inconsistent with the surrounding DAQmx error code naming style (which also abbreviates <code>USB</code>, not <em>UniversalSerialBus</em>), and would constitute a breaking rename of a public API symbol. There is a single occurrence in the API (a legacy error code), and <code>ISOC</code> is too specialised a domain abbreviation to expand without losing precision and consistency.</td></tr>
</table>

## `lvls`

| Line | Content |
| ---: | ------- |
| [:4767](../api_names.txt#L4767) | `ReferenceTrigger.anlg_multi_edge_lvls` |
| [:4816](../api_names.txt#L4816) | `StartTrigger.anlg_multi_edge_lvls` |

<table>
<tr><td><strong>Recommendation</strong></td><td>Add <code>lvls</code> to the dictionary.</td></tr>
<tr><td><strong>Rationale</strong></td><td><code>lvl</code> is already in the approved DAQmx abbreviations list (Level: Lvl). <code>lvls</code> is simply its plural inflection — the relationship between <em>level</em> and <em>levels</em> is regular inflectional morphology (number). Approving the plural form is a natural and minimal extension of the existing approved abbreviation.</td></tr>
</table>

## `MULT`

| Line | Content |
| ---: | ------- |
| [:927](../api_names.txt#L927) | `DAQmxErrors.AI_INPUT_BUFFER_SIZE_NOT_MULT_OF_XFER_SIZE` |
| [:1588](../api_names.txt#L1588) | `DAQmxErrors.INTERNAL_AI_INPUT_SRC_IN_MULT_CHAN_GROUPS` |
| [:1860](../api_names.txt#L1860) | `DAQmxErrors.MULT_DEVS_MULT_PHYS_CHANS` |
| [:1861](../api_names.txt#L1861) | `DAQmxErrors.MULT_SCAN_OPS_IN_ONE_CHASSIS` |
| [:1991](../api_names.txt#L1991) | `DAQmxErrors.OUTPUT_BUFFER_SIZE_NOT_MULT_OF_XFER_SIZE` |
| [:2337](../api_names.txt#L2337) | `DAQmxErrors.SAMP_PER_CHAN_NOT_MULT_OF_XFER_SIZE` |
| [:2625](../api_names.txt#L2625) | `DAQmxErrors.WAVEFORM_LENGTH_NOT_MULT_OF_QUANTUM` |
| [:2646](../api_names.txt#L2646) | `DAQmxErrors.WRITE_OFFSET_NOT_MULT_OF_INCR` |

<table>
<tr><td><b>Recommendations</b></td><td><ul>
<li>Deprecate <code>DAQmxErrors.AI_INPUT_BUFFER_SIZE_NOT_MULT_OF_XFER_SIZE</code> and replace with <code>DAQmxErrors.AI_INPUT_BUFFER_SIZE_NOT_MULTIPLE_OF_XFER_SIZE</code>.</li>
<li>Deprecate <code>DAQmxErrors.INTERNAL_AI_INPUT_SRC_IN_MULT_CHAN_GROUPS</code> — the correctly-spelled equivalent <code>DAQmxErrors.INTERNAL_AI_INPUT_SRC_IN_MULTIPLE_CHAN_GROUPS</code> already exists (line 1589); this is a straight removal of the misspelled alias.</li>
<li>Deprecate <code>DAQmxErrors.MULT_DEVS_MULT_PHYS_CHANS</code> and replace with <code>DAQmxErrors.MULTIPLE_DEVS_MULTIPLE_PHYS_CHANS</code>.</li>
<li>Deprecate <code>DAQmxErrors.MULT_SCAN_OPS_IN_ONE_CHASSIS</code> and replace with <code>DAQmxErrors.MULTIPLE_SCAN_OPS_IN_ONE_CHASSIS</code>.</li>
<li>Deprecate <code>DAQmxErrors.OUTPUT_BUFFER_SIZE_NOT_MULT_OF_XFER_SIZE</code> and replace with <code>DAQmxErrors.OUTPUT_BUFFER_SIZE_NOT_MULTIPLE_OF_XFER_SIZE</code>.</li>
<li>Deprecate <code>DAQmxErrors.SAMP_PER_CHAN_NOT_MULT_OF_XFER_SIZE</code> and replace with <code>DAQmxErrors.SAMP_PER_CHAN_NOT_MULTIPLE_OF_XFER_SIZE</code>.</li>
<li>Deprecate <code>DAQmxErrors.WAVEFORM_LENGTH_NOT_MULT_OF_QUANTUM</code> and replace with <code>DAQmxErrors.WAVEFORM_LENGTH_NOT_MULTIPLE_OF_QUANTUM</code>.</li>
<li>Deprecate <code>DAQmxErrors.WRITE_OFFSET_NOT_MULT_OF_INCR</code> and replace with <code>DAQmxErrors.WRITE_OFFSET_NOT_MULTIPLE_OF_INCR</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>MULTI</code> is an approved DAQmx prefix abbreviation, used extensively throughout the API (e.g. <code>MULTI_CHAN_TYPES_IN_TASK</code>, <code>MULTI_DEVS_IN_TASK</code>, <code>AnalogMultiChannelReader</code>). <code>MULTIPLE</code> is the fully-spelled form used consistently in parallel error codes (e.g. <code>SAMP_PER_CHAN_NOT_MULTIPLE_OF_INCR</code>, <code>INTERMEDIATE_BUFFER_SIZE_NOT_MULTIPLE_OF_INCR</code>, <code>MULTIPLE_ACTIVE_PHYS_CHANS_NOT_SUPPORTED</code>). <code>MULT</code> is neither the approved prefix (<code>MULTI</code>) nor the spelled-out adjective (<code>MULTIPLE</code>) — it is an inconsistent third form that appears in no other DAQmx naming convention. The "multiple of" sense is already spelled out as <code>MULTIPLE</code> in close siblings of these error codes, making the inconsistency directly visible in the same namespace.</td></tr>
</table>

## `nidaqmx`

| Line | Content |
| ---: | ------- |
| [:1](../api_names.txt#L1) | `nidaqmx Python API names  —  5263 entries  (file paths relative to generated/nidaqmx/)` |

<table>
<tr><td><b>Recommendations</b></td><td>N/A</td></tr>
<tr><td><b>Rationale</b></td><td>The sole occurrence is the file header comment on line 1, not an API symbol. <code>nidaqmx</code> does not appear as a class name, method name, property name, parameter name, or error code in the API itself.</td></tr>
</table>

## `numpy`

| Line | Content |
| ---: | ------- |
| [:2906](../api_names.txt#L2906) | `InStream.read_into(numpy_array)` |
| [:2909](../api_names.txt#L2909) | `OutStream.write(numpy_array)` |

<table>
<tr><td><b>Recommendations</b></td><td><ul>
<li>Rename the parameter <code>numpy_array</code> to <code>data</code> in both <code>InStream.read_into()</code> and <code>OutStream.write()</code>.</li>
<li>Add a type annotation using <code>numpy.typing.NDArray</code> (or <code>npt.NDArray</code>) to convey the constraint via the type system.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>The parameter is named <code>numpy_array</code> solely to signal that it must be a <code>numpy.ndarray</code> — a constraint that belongs in a type annotation, not in the parameter name. The Pythonic approach is to use a plain descriptive name (<code>data</code>) and express the type requirement as <code>numpy.typing.NDArray</code>. This removes <code>numpy</code> from the API symbol namespace entirely, eliminates the cspell flag, and aligns with modern Python typing conventions. <code>numpy.typing</code> is available from NumPy 1.20 (released January 2021) and provides <code>NDArray</code> as the canonical type alias for this purpose.</td></tr>
</table>

## `nums`

| Line | Content |
| ---: | ------- |
| [:5279](../api_names.txt#L5279) | `Device.accessory_product_nums` |
| [:5281](../api_names.txt#L5281) | `Device.accessory_serial_nums` |
| [:5366](../api_names.txt#L5366) | `Device.id_pin_mem_serial_nums` |

<table>
<tr><td><b>Recommendations</b></td><td><ul>
<li>Deprecate <code>Device.accessory_product_nums</code> and replace with <code>Device.accessory_product_numbers</code>.</li>
<li>Deprecate <code>Device.accessory_serial_nums</code> and replace with <code>Device.accessory_serial_numbers</code>.</li>
<li>Deprecate <code>Device.id_pin_mem_serial_nums</code> and replace with <code>Device.id_pin_mem_serial_numbers</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>Spelling out <code>numbers</code> removes the need to add <code>nums</code> to the dictionary at all. The spelled-out form is already used in the Python property API (<code>Task.number_of_channels</code>, <code>Task.number_of_devices</code>), so <code>numbers</code> is consistent with the existing precedent. The singular abbreviation <code>num</code> is used in ~60 other properties (<code>serial_num</code>, <code>slot_num</code>, <code>product_num</code>, etc.) and is already approved — those do not need to change. Only these three plural forms are anomalous, and renaming them costs nothing.</td></tr>
</table>

## `onbrd`

| Line | Content |
| ---: | ------- |
| [:3061](../api_names.txt#L3061) | `InStream.input_onbrd_buf_size` |
| [:3117](../api_names.txt#L3117) | `OutStream.output_onbrd_buf_size` |

<table>
<tr><td><b>Recommendations</b></td><td><ul>
<li>Deprecate <code>InStream.input_onbrd_buf_size</code> and replace with <code>InStream.input_onboard_buf_size</code>.</li>
<li>Deprecate <code>OutStream.output_onbrd_buf_size</code> and replace with <code>OutStream.output_onboard_buf_size</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>onbrd</code> matches no other naming pattern in the API. The rest of the API uses either <code>ONBOARD</code> (joined, dominant form: <code>ONBOARD_MEMORY_CUSTOM_THRESHOLD</code>, <code>CAN_EXPORT_ONLY_ONBOARD_SAMP_CLK</code>, <code>SyncPulseType.ONBOARD</code>, etc.) or <code>ON_BOARD</code> (split form). Renaming to <code>onboard</code> aligns with the dominant convention, requires no dictionary entry, and affects only these two properties.</td></tr>
</table>

## `outp`

| Line | Content |
| ---: | ------- |
| [:2958](../api_names.txt#L2958) | `Timing.cfg_burst_handshaking_timing_export_clock(sample_clk_outp_term)` |

<table>
<tr><td><b>Recommendations</b></td><td><ul>
<li>Rename the parameter <code>sample_clk_outp_term</code> to <code>sample_clk_output_term</code> in <code>Timing.cfg_burst_handshaking_timing_export_clock()</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>The approved DAQmx abbreviations list explicitly defines <code>Output: Output</code> — "output" is always spelled in full and has no approved abbreviation. <code>outp</code> is therefore non-standard. The rename is a single parameter in a single method and requires no dictionary entry.</td></tr>
</table>

## `PRESCALED`

| Line | Content |
| ---: | ------- |
| [:1140](../api_names.txt#L1140) | `DAQmxErrors.CHAN_CAL_TABLE_NUM_SCALED_NOT_EQUAL_NUM_PRESCALED_VALS` |

<table>
<tr><td><b>Recommendations</b></td><td>Add <code>PRESCALED</code> and <code>prescaled</code> to the dictionary.</td></tr>
<tr><td><b>Rationale</b></td><td><em>Prescaled</em> (also written <em>pre-scaled</em>) is a standard term in signal-conditioning and measurement contexts, meaning "belonging to the domain before a scaling transformation is applied". In DAQmx's custom-scale API, every scale maps a <em>prescaled</em> (raw sensor) value to a <em>scaled</em> (engineering-units) value. The word is used consistently as one token throughout both the Python property API (<code>prescaled_max</code>, <code>prescaled_min</code>, <code>prescaled_vals</code>) and the error codes (<code>NUM_PRESCALED_VALS</code>, <code>PRE_SCALED_VALS</code>). Note: <em>prescaled</em> in this context is entirely unrelated to the electronics <em>prescaler</em> (a frequency-divider circuit) — see the <code>PRESCALER</code> section below.</td></tr>
</table>

## `prescaled`

| Line | Content |
| ---: | ------- |
| [:5517](../api_names.txt#L5517) | `Scale.create_map_scale(prescaled_max)` |
| [:5518](../api_names.txt#L5518) | `Scale.create_map_scale(prescaled_min)` |
| [:5531](../api_names.txt#L5531) | `Scale.create_table_scale(prescaled_vals)` |

<table>
<tr><td><b>Recommendations</b></td><td>See <a href="#prescaled-1"><code>PRESCALED</code></a> above.</td></tr>
</table>

## `PRESCALER`

| Line | Content |
| ---: | ------- |
| [:2155](../api_names.txt#L2155) | `DAQmxErrors.PRESCALER_NOT_1_FOR_INPUT_TERMINAL` |
| [:2156](../api_names.txt#L2156) | `DAQmxErrors.PRESCALER_NOT_1_FOR_TIMEBASE_SRC` |

<table>
<tr><td><b>Recommendations</b></td><td>Add <code>PRESCALER</code> and <code>prescaler</code> to the dictionary.</td></tr>
<tr><td><b>Rationale</b></td><td>A <em>prescaler</em> is a standard electronics term for a counter-divider circuit that reduces a high-frequency signal to a lower frequency by integer division, extending the range of frequency counters and timers. The canonical spelling is <em>prescaler</em> — one word, no hyphen (confirmed by Wikipedia and common usage in datasheets and embedded systems). In DAQmx, the prescaler divides the input signal frequency before it reaches the counter hardware, allowing the counter to handle signals that would otherwise exceed its maximum input frequency. The term is used consistently throughout the API (<code>ci_prescaler</code>, <code>co_prescaler</code>, error codes). Note: this is entirely unrelated to the measurement-scaling concept of <em>prescaled values</em> — see the <code>PRESCALED</code> section above.</td></tr>
</table>

## `prescaler`

| Line | Content |
| ---: | ------- |
| [:3639](../api_names.txt#L3639) | `CIChannel.ci_prescaler` |
| [:3756](../api_names.txt#L3756) | `COChannel.co_prescaler` |

<table>
<tr><td><b>Recommendations</b></td><td>See <a href="#prescaler-1"><code>PRESCALER</code></a> above.</td></tr>
</table>

## `PRETRIG`

| Line | Content |
| ---: | ------- |
| [:2540](../api_names.txt#L2540) | `DAQmxErrors.TOO_MANY_PRETRIG_PLUS_MIN_POST_TRIG_SAMPS` |
| [:2746](../api_names.txt#L2746) | `DAQmxWarnings.PRETRIG_COERCION` |

<table>
<tr><td><b>Recommendations</b></td><td><ul>
<li>Deprecate <code>DAQmxWarnings.PRETRIG_COERCION</code> and replace with <code>DAQmxWarnings.PRETRIGGER_COERCION</code>.</li>
<li>Deprecate <code>DAQmxErrors.TOO_MANY_PRETRIG_PLUS_MIN_POST_TRIG_SAMPS</code> and replace with <code>DAQmxErrors.TOO_MANY_PRETRIGGER_PLUS_MIN_POSTTRIGGER_SAMPS</code>.</li>
<li>Also deprecate <code>DAQmxErrors.TOO_MANY_POST_TRIG_SAMPS_PER_CHAN</code> (listed under <a href="#samps"><code>SAMPS</code></a>) and replace with <code>DAQmxErrors.TOO_MANY_POSTTRIGGER_SAMPS_PER_CHAN</code>.</li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>NI's own DAQmx documentation uses the one-word forms <em>pretrigger</em> and <em>posttrigger</em> without abbreviation or hyphen: <q>Data acquired up to the reference point is pretrigger data. Data acquired after this reference point is posttrigger data.</q> <code>PRETRIG</code> and <code>POST_TRIG</code> are therefore non-standard abbreviations of established NI terms. The spelled-out form already dominates the API: <code>PRETRIGGER</code> appears in <code>ReadRelativeTo.FIRST_PRETRIGGER_SAMPLE</code> and <code>pretrigger_samples</code> is the parameter name on all five <code>ReferenceTrigger.cfg_*_ref_trig()</code> methods. The abbreviated <code>pretrig_samples</code> property on <code>ReferenceTrigger</code> directly conflicts with the <code>pretrigger_samples</code> parameter on the same class. No dictionary entry is needed; the full words <code>PRETRIGGER</code> and <code>POSTTRIGGER</code> will be accepted once added to the dictionary (see <a href="#pretrigger-1"><code>PRETRIGGER</code></a> below).</td></tr>
</table>

## `pretrig`

| Line | Content |
| ---: | ------- |
| [:4794](../api_names.txt#L4794) | `ReferenceTrigger.pretrig_samples` |

<table>
<tr><td><b>Recommendations</b></td><td>See <a href="#pretrig-1"><code>PRETRIG</code></a> above. Additionally, deprecate <code>ReferenceTrigger.pretrig_samples</code> and replace with <code>ReferenceTrigger.pretrigger_samples</code>.</td></tr>
</table>

## `PRETRIGGER`

| Line | Content |
| ---: | ------- |
| [:606](../api_names.txt#L606) | `ReadRelativeTo.FIRST_PRETRIGGER_SAMPLE` |

<table>
<tr><td><b>Recommendations</b></td><td>Add <code>PRETRIGGER</code>, <code>pretrigger</code>, <code>POSTTRIGGER</code>, and <code>posttrigger</code> to the dictionary.</td></tr>
<tr><td><b>Rationale</b></td><td>NI's DAQmx documentation defines these terms explicitly and uses the one-word, unhyphenated spellings: <q>Data acquired up to the reference point is pretrigger data. Data acquired after this reference point is posttrigger data.</q> Both words are well-established compound adjectives in DAQ and oscilloscope contexts (the reference trigger divides a capture buffer into a pretrigger region and a posttrigger region). The Python API consistently uses <code>pretrigger_samples</code> as the parameter name on all five <code>ReferenceTrigger.cfg_*_ref_trig()</code> methods, and <code>FIRST_PRETRIGGER_SAMPLE</code> as an enum member. <code>POSTTRIGGER</code>/<code>posttrigger</code> do not yet appear in the API but are the natural counterparts needed when the <code>POST_TRIG</code> error codes are renamed (see <a href="#pretrig"><code>PRETRIG</code></a> above). All four forms are added together to keep uppercase/lowercase pairs consistent, matching the approach used for <code>PRESCALED</code>/<code>prescaled</code> and <code>PRESCALER</code>/<code>prescaler</code>.</td></tr>
</table>

## `pretrigger`

| Line | Content |
| ---: | ------- |
| [:4660](../api_names.txt#L4660) | `ReferenceTrigger.cfg_anlg_edge_ref_trig(pretrigger_samples)` |
| [:4664](../api_names.txt#L4664) | `ReferenceTrigger.cfg_anlg_multi_edge_ref_trig(pretrigger_samples)` |
| [:4668](../api_names.txt#L4668) | `ReferenceTrigger.cfg_anlg_window_ref_trig(pretrigger_samples)` |
| [:4673](../api_names.txt#L4673) | `ReferenceTrigger.cfg_dig_edge_ref_trig(pretrigger_samples)` |
| [:4676](../api_names.txt#L4676) | `ReferenceTrigger.cfg_dig_pattern_ref_trig(pretrigger_samples)` |

<table>
<tr><td><b>Recommendations</b></td><td>See <a href="#pretrigger-1"><code>PRETRIGGER</code></a> above.</td></tr>
</table>

## `PRPTY`

| Line | Content |
| ---: | ------- |
| [:913](../api_names.txt#L913) | `DAQmxErrors.ACTIVE_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PRPTY` |
| [:914](../api_names.txt#L914) | `DAQmxErrors.ACTIVE_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PRPTY` |
| [:918](../api_names.txt#L918) | `DAQmxErrors.ACTIVE_PHYS_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PRPTY` |
| [:919](../api_names.txt#L919) | `DAQmxErrors.ACTIVE_PHYS_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PRPTY` |
| [:1350](../api_names.txt#L1350) | `DAQmxErrors.DIFFERENT_PRPTY_VALS_NOT_SUPPORTED_ON_DEV` |
| [:1368](../api_names.txt#L1368) | `DAQmxErrors.DIG_PRPTY_CANNOT_BE_SET_PER_LINE` |
| [:1455](../api_names.txt#L1455) | `DAQmxErrors.F_64_PRPTY_VAL_NOT_UNSIGNED_INT` |
| [:1505](../api_names.txt#L1505) | `DAQmxErrors.GET_ACTIVE_DEV_PRPTY_FAILED_DUE_TO_DIFFT_VALS` |
| [:1976](../api_names.txt#L1976) | `DAQmxErrors.ONLY_USE_PAUSE_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES` |
| [:1977](../api_names.txt#L1977) | `DAQmxErrors.ONLY_USE_REF_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES` |
| [:1978](../api_names.txt#L1978) | `DAQmxErrors.ONLY_USE_START_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES` |
| [:2184](../api_names.txt#L2184) | `DAQmxErrors.PRPTY_GET_IMPLIED_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS` |
| [:2185](../api_names.txt#L2185) | `DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS` |
| [:2186](../api_names.txt#L2186) | `DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFT_VALUES` |
| [:2187](../api_names.txt#L2187) | `DAQmxErrors.PRPTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS` |

<table>
<tr><td><b>Recommendations</b></td><td>Deprecate all 15 names and replace <code>PRPTY</code> with <code>PROPERTY</code>:<ul>
<li><code>DAQmxErrors.ACTIVE_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PRPTY</code> → <code>DAQmxErrors.ACTIVE_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PROPERTY</code></li>
<li><code>DAQmxErrors.ACTIVE_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PRPTY</code> → <code>DAQmxErrors.ACTIVE_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PROPERTY</code></li>
<li><code>DAQmxErrors.ACTIVE_PHYS_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PRPTY</code> → <code>DAQmxErrors.ACTIVE_PHYS_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PROPERTY</code></li>
<li><code>DAQmxErrors.ACTIVE_PHYS_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PRPTY</code> → <code>DAQmxErrors.ACTIVE_PHYS_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PROPERTY</code></li>
<li><code>DAQmxErrors.DIFFERENT_PRPTY_VALS_NOT_SUPPORTED_ON_DEV</code> → <code>DAQmxErrors.DIFFERENT_PROPERTY_VALS_NOT_SUPPORTED_ON_DEV</code></li>
<li><code>DAQmxErrors.DIG_PRPTY_CANNOT_BE_SET_PER_LINE</code> → <code>DAQmxErrors.DIG_PROPERTY_CANNOT_BE_SET_PER_LINE</code></li>
<li><code>DAQmxErrors.F_64_PRPTY_VAL_NOT_UNSIGNED_INT</code> → <code>DAQmxErrors.F_64_PROPERTY_VAL_NOT_UNSIGNED_INT</code></li>
<li><code>DAQmxErrors.GET_ACTIVE_DEV_PRPTY_FAILED_DUE_TO_DIFFT_VALS</code> → <code>DAQmxErrors.GET_ACTIVE_DEV_PROPERTY_FAILED_DUE_TO_DIFFT_VALS</code></li>
<li><code>DAQmxErrors.ONLY_USE_PAUSE_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES</code> → <code>DAQmxErrors.ONLY_USE_PAUSE_TRIG_SRC_PROPERTY_WITH_DEV_DATA_LINES</code></li>
<li><code>DAQmxErrors.ONLY_USE_REF_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES</code> → <code>DAQmxErrors.ONLY_USE_REF_TRIG_SRC_PROPERTY_WITH_DEV_DATA_LINES</code></li>
<li><code>DAQmxErrors.ONLY_USE_START_TRIG_SRC_PRPTY_WITH_DEV_DATA_LINES</code> → <code>DAQmxErrors.ONLY_USE_START_TRIG_SRC_PROPERTY_WITH_DEV_DATA_LINES</code></li>
<li><code>DAQmxErrors.PRPTY_GET_IMPLIED_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code> → <code>DAQmxErrors.PROPERTY_GET_IMPLIED_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code></li>
<li><code>DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code> → <code>DAQmxErrors.PROPERTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code></li>
<li><code>DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFT_VALUES</code> → <code>DAQmxErrors.PROPERTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFT_VALUES</code></li>
<li><code>DAQmxErrors.PRPTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code> → <code>DAQmxErrors.PROPERTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS</code></li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>PRPTY</code> is a non-standard abbreviation with no precedent in the API. The API uses <code>PROPERTY</code> spelled in full throughout: 45+ error and warning names, as well as all public Python properties on every class. No approved abbreviation for <em>property</em> appears in the DAQmx abbreviations list. No dictionary entry is needed; <code>PROPERTY</code> is an ordinary English word. Note: three further names use <code>PROP</code> or <code>PROPS</code> as abbreviations for <em>property</em>/<em>properties</em> — see the <a href="#prop-and-props"><code>PROP</code> and <code>PROPS</code></a> appendix section.</td></tr>
</table>

## `RQST`

| Line | Content |
| ---: | ------- |
| [:1953](../api_names.txt#L1953) | `DAQmxErrors.NOT_ENOUGH_SAMPS_WRITTEN_FOR_INITIAL_XFER_RQST_CONDITION` |

<table>
<tr><td><b>Recommendations</b></td><td>Deprecate <code>DAQmxErrors.NOT_ENOUGH_SAMPS_WRITTEN_FOR_INITIAL_XFER_RQST_CONDITION</code> and replace with <code>DAQmxErrors.NOT_ENOUGH_SAMPS_WRITTEN_FOR_INITIAL_XFER_REQ_CONDITION</code>.</td></tr>
<tr><td><b>Rationale</b></td><td><code>RQST</code> is a non-standard abbreviation of <em>request</em>. The approved DAQmx abbreviations list defines <code>Request: Req</code>, and <code>REQ</code> is the form used consistently throughout the Python property API: <code>ai_data_xfer_req_cond</code>, <code>ai_usb_xfer_req_count</code>, <code>ai_usb_xfer_req_size</code>, and their equivalents on <code>AOChannel</code>, <code>CIChannel</code>, <code>COChannel</code>, <code>DIChannel</code>, and <code>DOChannel</code> — 19 properties in total. No dictionary entry is needed; <code>REQ</code> is already accepted. Note: six error codes use <code>REQUEST</code>/<code>REQUESTED</code> spelled in full — see the <a href="#request-vs-req"><code>REQUEST</code> vs. <code>REQ</code></a> appendix section.</td></tr>
</table>

## `SAMPS`

| Line | Content |
| ---: | ------- |
| [:926](../api_names.txt#L926) | `DAQmxErrors.AI_EVERY_N_SAMPS_EVENT_INTERVAL_NOT_MULTIPLE_OF_2` |
| [:948](../api_names.txt#L948) | `DAQmxErrors.AO_EVERY_N_SAMPS_EVENT_INTERVAL_NOT_MULTIPLE_OF_2` |
| [:997](../api_names.txt#L997) | `DAQmxErrors.BUFFER_SIZE_NOT_MULTIPLE_OF_EVERY_N_SAMPS_EVENT_INTERVAL_NO_IRQ_ON_DEV` |
| [:998](../api_names.txt#L998) | `DAQmxErrors.BUFFER_SIZE_NOT_MULTIPLE_OF_EVERY_N_SAMPS_EVENT_INTERVAL_WHEN_DMA` |
| [:1036](../api_names.txt#L1036) | `DAQmxErrors.CANNOT_CALCULATE_NUM_SAMPS_TASK_NOT_STARTED` |
| [:1417](../api_names.txt#L1417) | `DAQmxErrors.EVERY_N_SAMPS_ACQ_INTO_BUFFER_EVENT_ALREADY_REGISTERED` |
| [:1418](../api_names.txt#L1418) | `DAQmxErrors.EVERY_N_SAMPS_ACQ_INTO_BUFFER_NOT_FOR_OUTPUT` |
| [:1419](../api_names.txt#L1419) | `DAQmxErrors.EVERY_N_SAMPS_EVENT_ALREADY_REGISTERED` |
| [:1420](../api_names.txt#L1420) | `DAQmxErrors.EVERY_N_SAMPS_EVENT_INTERVAL_ZERO_NOT_SUPPORTED` |
| [:1421](../api_names.txt#L1421) | `DAQmxErrors.EVERY_N_SAMPS_TRANSFERRED_FROM_BUFFER_EVENT_ALREADY_REGISTERED` |
| [:1422](../api_names.txt#L1422) | `DAQmxErrors.EVERY_N_SAMPS_TRANSFERRED_FROM_BUFFER_EVENT_NOT_SUPPORTED_BY_DEVICE` |
| [:1423](../api_names.txt#L1423) | `DAQmxErrors.EVERY_N_SAMPS_TRANSFERRED_FROM_BUFFER_NOT_FOR_INPUT` |
| [:1572](../api_names.txt#L1572) | `DAQmxErrors.INPUT_BUFFER_SIZE_NOT_EQUAL_SAMPS_PER_CHAN_FOR_FINITE_SAMP_MODE` |
| [:1582](../api_names.txt#L1582) | `DAQmxErrors.INSUFFICIENT_ON_BOARD_MEM_FOR_NUM_RECS_AND_SAMPS` |
| [:1684](../api_names.txt#L1684) | `DAQmxErrors.INVALID_NUM_SAMPS_TO_WRITE` |
| [:1794](../api_names.txt#L1794) | `DAQmxErrors.LOGGING_SAMPS_PER_FILE_NOT_DIVISIBLE` |
| [:1916](../api_names.txt#L1916) | `DAQmxErrors.NO_COMMON_SAMP_RATE_FOUND_NO_REPEAT_SAMPS` |
| [:1952](../api_names.txt#L1952) | `DAQmxErrors.NONBUFFERED_READ_MORE_THAN_SAMPS_PER_CHAN` |
| [:1953](../api_names.txt#L1953) | `DAQmxErrors.NOT_ENOUGH_SAMPS_WRITTEN_FOR_INITIAL_XFER_RQST_CONDITION` |
| [:1958](../api_names.txt#L1958) | `DAQmxErrors.NUM_SAMPS_TO_WAIT_NOT_GREATER_THAN_ZERO_IN_SCRIPT` |
| [:1959](../api_names.txt#L1959) | `DAQmxErrors.NUM_SAMPS_TO_WAIT_NOT_MULTIPLE_OF_ALIGNMENT_QUANTUM_IN_SCRIPT` |
| [:1961](../api_names.txt#L1961) | `DAQmxErrors.ODD_TOTAL_NUM_SAMPS_TO_WRITE` |
| [:2358](../api_names.txt#L2358) | `DAQmxErrors.SAMPS_PER_CHAN_TOO_BIG` |
| [:2539](../api_names.txt#L2539) | `DAQmxErrors.TOO_MANY_POST_TRIG_SAMPS_PER_CHAN` |
| [:2540](../api_names.txt#L2540) | `DAQmxErrors.TOO_MANY_PRETRIG_PLUS_MIN_POST_TRIG_SAMPS` |
| [:2633](../api_names.txt#L2633) | `DAQmxErrors.WHEN_ACQ_COMP_AND_NUM_SAMPS_PER_CHAN_EXCEEDS_ON_BRD_BUF_SIZE` |
| [:2653](../api_names.txt#L2653) | `DAQmxErrors.WROTE_MULTI_SAMPS_USING_SINGLE_SAMP_WRITE` |
| [:2743](../api_names.txt#L2743) | `DAQmxWarnings.POSSIBLY_INVALID_CTR_SAMPS_IN_FINITE_DMA_ACQ` |

<table>
<tr><td><b>Recommendations</b></td><td>Add <code>SAMPS</code> and <code>samps</code> to the dictionary.</td></tr>
<tr><td><b>Rationale</b></td><td><code>SAMP</code> is already in the approved DAQmx abbreviations list (<code>Sample: Samp</code>). <code>SAMPS</code> and <code>samps</code> are simply its plural inflection — the relationship between <em>sample</em> and <em>samples</em> is regular inflectional morphology (number). Approving the plural forms is a natural and minimal extension of the existing approved abbreviation. <code>SAMPS</code> is used extensively in error and warning codes (27 names), and <code>samps_per_chan</code> is a ubiquitous parameter name across all <code>Timing.cfg_*</code> methods as well as <code>InStream</code>, <code>CIChannel</code>, and error classes.</td></tr>
</table>

## `samps`

| Line | Content |
| ---: | ------- |
| [:2962](../api_names.txt#L2962) | `Timing.cfg_burst_handshaking_timing_export_clock(samps_per_chan)` |
| [:2969](../api_names.txt#L2969) | `Timing.cfg_burst_handshaking_timing_import_clock(samps_per_chan)` |
| [:2973](../api_names.txt#L2973) | `Timing.cfg_change_detection_timing(samps_per_chan)` |
| [:2975](../api_names.txt#L2975) | `Timing.cfg_handshaking_timing(samps_per_chan)` |
| [:2977](../api_names.txt#L2977) | `Timing.cfg_implicit_timing(samps_per_chan)` |
| [:2981](../api_names.txt#L2981) | `Timing.cfg_pipelined_samp_clk_timing(samps_per_chan)` |
| [:2986](../api_names.txt#L2986) | `Timing.cfg_samp_clk_timing(samps_per_chan)` |
| [:3067](../api_names.txt#L3067) | `InStream.logging_samps_per_file` |
| [:3621](../api_names.txt#L3621) | `CIChannel.ci_num_possibly_invalid_samps` |
| [:5567](../api_names.txt#L5567) | `DaqReadError.samps_per_chan_read` |
| [:5570](../api_names.txt#L5570) | `DaqWriteError.samps_per_chan_written` |

<table>
<tr><td><b>Recommendations</b></td><td>See <a href="#samps-1"><code>SAMPS</code></a> above.</td></tr>
</table>

## `SMIO`

| Line | Content |
| ---: | ------- |
| [:2420](../api_names.txt#L2420) | `DAQmxErrors.SMIO_PAUSE_TRIGGERS_NOT_SUPPORTED_WITH_CHANNEL_EXPANSION` |

<table>
<tr><td><b>Recommendations</b></td><td>Add <code>SMIO</code> to the dictionary.</td></tr>
<tr><td><b>Rationale</b></td><td><code>SMIO</code> is NI's initializer for <em>Simultaneously-sampling Multifunction I/O</em> — the device category exemplified by NI's S Series DAQ hardware, which uses a dedicated ADC per channel rather than a shared multiplexed ADC. It is a well-established hardware-family designator in DAQmx documentation and device naming. No spelling-out or renaming is practical: the approved abbreviations list defines <code>Simultaneous: Simultaneous</code> (no approved shortening) and <code>Multifunction: (not listed)</code>, so the compliant expansion would be <code>SIMULTANEOUS_SAMPLING_MULTIFUNCTION_IO</code> — far too long for an error-code token. <code>SMIO</code> is in the same class as <code>IRIGB</code>: a compact, domain-specific initializer for a hardware standard where no shorter standard-compliant alternative exists.</td></tr>
</table>

## `SPECD`

| Line | Content |
| ---: | ------- |
| [:913](../api_names.txt#L913) | `DAQmxErrors.ACTIVE_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PRPTY` |
| [:914](../api_names.txt#L914) | `DAQmxErrors.ACTIVE_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PRPTY` |
| [:918](../api_names.txt#L918) | `DAQmxErrors.ACTIVE_PHYS_CHAN_NOT_SPECD_WHEN_GETTING_1_LINE_PRPTY` |
| [:919](../api_names.txt#L919) | `DAQmxErrors.ACTIVE_PHYS_CHAN_TOO_MANY_LINES_SPECD_WHEN_GETTING_PRPTY` |
| [:1006](../api_names.txt#L1006) | `DAQmxErrors.BUFFERED_OPS_NOT_SUPPORTED_IN_SPECD_SLOT_FOR_CDAQ` |
| [:1014](../api_names.txt#L1014) | `DAQmxErrors.CAL_CHAN_FORWARD_POLY_COEF_NOT_SPECD` |
| [:1015](../api_names.txt#L1015) | `DAQmxErrors.CAL_CHAN_REVERSE_POLY_COEF_NOT_SPECD` |
| [:1141](../api_names.txt#L1141) | `DAQmxErrors.CHAN_CAL_TABLE_PRE_SCALED_VALS_NOT_SPECD` |
| [:1142](../api_names.txt#L1142) | `DAQmxErrors.CHAN_CAL_TABLE_SCALED_VALS_NOT_SPECD` |
| [:1147](../api_names.txt#L1147) | `DAQmxErrors.CHAN_NAMES_NOT_SPECD_IN_CFG_FILE` |
| [:1184](../api_names.txt#L1184) | `DAQmxErrors.CJC_CHAN_NOT_SPECD` |
| [:1318](../api_names.txt#L1318) | `DAQmxErrors.DEVICE_AND_CONNECTOR_SPECD_ALREADY_OCCUPIED` |
| [:1356](../api_names.txt#L1356) | `DAQmxErrors.DIG_DEV_CHANS_SPECD_IN_MODE_OTHER_THAN_PARALLEL` |
| [:1454](../api_names.txt#L1454) | `DAQmxErrors.EXTRA_PROPERTY_DETECTED_IN_SPECD_OBJECT` |
| [:1490](../api_names.txt#L1490) | `DAQmxErrors.FORWARD_POLYNOMIAL_COEF_NOT_SPECD` |
| [:1543](../api_names.txt#L1543) | `DAQmxErrors.ILLEGAL_ACCESSORY_TYPE_FOR_DEVICE_SPECD` |
| [:1547](../api_names.txt#L1547) | `DAQmxErrors.INCAPABLE_SCC_DIGITIZING_DEVICE_SPECD` |
| [:1548](../api_names.txt#L1548) | `DAQmxErrors.INCAPABLE_TEDS_INTERFACE_CONTROLLING_DEVICE_SPECD` |
| [:1630](../api_names.txt#L1630) | `DAQmxErrors.INVALID_CARRIER_SLOT_NUMBER_SPECD` |
| [:1631](../api_names.txt#L1631) | `DAQmxErrors.INVALID_CDAQ_SLOT_NUMBER_SPECD` |
| [:1649](../api_names.txt#L1649) | `DAQmxErrors.INVALID_DEVICE_CONNECTOR_NUMBER_SPECD` |
| [:1655](../api_names.txt#L1655) | `DAQmxErrors.INVALID_ENUM_VALUE_SPECD` |
| [:1661](../api_names.txt#L1661) | `DAQmxErrors.INVALID_FIELD_DAQ_BANK_NUMBER_SPECD` |
| [:1688](../api_names.txt#L1688) | `DAQmxErrors.INVALID_NUMERIC_FORMAT_SPECD` |
| [:1714](../api_names.txt#L1714) | `DAQmxErrors.INVALID_SCC_MODULE_FOR_SLOT_SPECD` |
| [:1715](../api_names.txt#L1715) | `DAQmxErrors.INVALID_SCC_SLOT_NUMBER_SPECD` |
| [:1717](../api_names.txt#L1717) | `DAQmxErrors.INVALID_SCXI_SLOT_NUMBER_SPECD` |
| [:1790](../api_names.txt#L1790) | `DAQmxErrors.LOCAL_CHANNEL_SPECD_WITH_NO_PARENT_TASK` |
| [:1857](../api_names.txt#L1857) | `DAQmxErrors.MORE_THAN_ONE_MATCH_FOR_SPECD_DEVICE` |
| [:1913](../api_names.txt#L1913) | `DAQmxErrors.NO_CHANS_SPECD_FOR_CHANGE_DETECT` |
| [:1914](../api_names.txt#L1914) | `DAQmxErrors.NO_CHANS_SPECD_FOR_PATTERN_SOURCE` |
| [:1931](../api_names.txt#L1931) | `DAQmxErrors.NO_MATCH_FOR_SPECD_DEVICE` |
| [:2124](../api_names.txt#L2124) | `DAQmxErrors.PHYS_CHAN_NOT_SUPPORTED_IN_SPECD_SLOT_FOR_CDAQ` |
| [:2151](../api_names.txt#L2151) | `DAQmxErrors.POWERUP_STATE_NOT_SPECD_FOR_ENTIRE_PORT` |
| [:2153](../api_names.txt#L2153) | `DAQmxErrors.POWERUP_TRISTATE_NOT_SPECD_FOR_ENTIRE_PORT` |
| [:2171](../api_names.txt#L2171) | `DAQmxErrors.PROPERTY_NOT_SPECD_FOR_ENTIRE_PORT` |
| [:2185](../api_names.txt#L2185) | `DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS` |
| [:2186](../api_names.txt#L2186) | `DAQmxErrors.PRPTY_GET_SPECD_ACTIVE_ITEM_FAILED_DUE_TO_DIFFT_VALUES` |
| [:2187](../api_names.txt#L2187) | `DAQmxErrors.PRPTY_GET_SPECD_SINGLE_ACTIVE_CHAN_FAILED_DUE_TO_DIFFT_VALS` |
| [:2260](../api_names.txt#L2260) | `DAQmxErrors.REVERSE_POLYNOMIAL_COEF_NOT_SPECD` |
| [:2320](../api_names.txt#L2320) | `DAQmxErrors.SAMP_CLK_RATE_MUST_BE_SPECD` |
| [:2331](../api_names.txt#L2331) | `DAQmxErrors.SAMP_CLK_TIMEBASE_RATE_NOT_SPECD` |
| [:2363](../api_names.txt#L2363) | `DAQmxErrors.SCC_CARRIER_SPECD_IS_MISSING` |
| [:2415](../api_names.txt#L2415) | `DAQmxErrors.SIM_PXI_DEV_REQ_SLOT_AND_CHASSIS_SPECD` |
| [:2425](../api_names.txt#L2425) | `DAQmxErrors.SPECD_DEVICE_DOES_NOT_SUPPORT_RTSI` |
| [:2426](../api_names.txt#L2426) | `DAQmxErrors.SPECD_DEVICE_IS_ALREADY_ON_RTSI_BUS` |
| [:2427](../api_names.txt#L2427) | `DAQmxErrors.SPECD_PROPERTY_VALUE_IS_INCOMPATIBLE_WITH_SAMPLE_TIMING_RESPONSE_MODE` |
| [:2428](../api_names.txt#L2428) | `DAQmxErrors.SPECD_PROPERTY_VALUE_IS_INCOMPATIBLE_WITH_SAMPLE_TIMING_TYPE` |
| [:2429](../api_names.txt#L2429) | `DAQmxErrors.SPECD_SLOT_ALREADY_OCCUPIED` |
| [:2477](../api_names.txt#L2477) | `DAQmxErrors.TABLE_SCALE_PRE_SCALED_VALS_NOT_SPECD` |
| [:2478](../api_names.txt#L2478) | `DAQmxErrors.TABLE_SCALE_SCALED_VALS_NOT_SPECD` |
| [:2537](../api_names.txt#L2537) | `DAQmxErrors.TOO_MANY_PHYSICAL_CHANS_FOR_TEDS_INTERFACE_SPECD` |
| [:2561](../api_names.txt#L2561) | `DAQmxErrors.TRISTATE_LOGIC_LEVEL_NOT_SPECD_FOR_ENTIRE_PORT` |
| [:2619](../api_names.txt#L2619) | `DAQmxErrors.WATCHDOG_EXPIRATION_TRISTATE_NOT_SPECD_FOR_ENTIRE_PORT` |

<table>
<tr><td><b>Recommendations</b></td><td>Add <code>SPECD</code> to the dictionary.</td></tr>
<tr><td><b>Rationale</b></td><td>The approved DAQmx abbreviations list includes two direct precedents: <code>Specification: Spec</code> and <code>Specifications: Specs</code>. <code>SPECD</code> is the past-participial form of the same root verb — <em>specify</em> — following the same inflectional morphology pattern already established by <code>CFGD</code> relative to <code>CFG</code> (<code>Configuration: Cfg</code>, <code>Configurations: Cfgs</code> are also both approved). Just as <code>CFGD</code> means <em>configured</em>, <code>SPECD</code> means <em>specified</em>. <code>SPECD</code> is used consistently across 49 error codes and is entirely unambiguous in context.</td></tr>
</table>

## `TCPIP`

| Line | Content |
| ---: | ------- |
| [:389](../api_names.txt#L389) | `BusType.TCPIP` |

<table>
<tr><td><b>Recommendations</b></td><td>Add <code>TCPIP</code> and <code>tcpip</code> to the dictionary.</td></tr>
<tr><td><b>Rationale</b></td><td><code>TCPIP</code> (Transmission Control Protocol/Internet Protocol) is a universally recognised networking initializer. Dropping the slash and writing it as a single unhyphenated token is well-established prior art across systems programming: the Windows network stack kernel driver is <code>tcpip.sys</code>, the Windows service registry key is <code>HKLM\SYSTEM\CurrentControlSet\Services\Tcpip</code>, PowerShell uses <code>Get-NetTCPIP</code> and <code>Set-NetTCPIPParameter</code>, and embedded/RTOS networking stacks (lwIP, FreeRTOS+TCP, Zephyr) all use <code>tcpip</code> as a single identifier token. NI's own LabVIEW tooling uses <code>TCPIP</code> as the internal token for its TCP/IP palette. The slash cannot appear in Python identifiers; <code>TCPIP</code> as one token is the only valid form.</td></tr>
</table>

## `tcpip`

| Line | Content |
| ---: | ------- |
| [:5386](../api_names.txt#L5386) | `Device.tcpip_ethernet_ip` |
| [:5387](../api_names.txt#L5387) | `Device.tcpip_hostname` |
| [:5388](../api_names.txt#L5388) | `Device.tcpip_wireless_ip` |

<table>
<tr><td><b>Recommendations</b></td><td>See <a href="#tcpip-1"><code>TCPIP</code></a> above.</td></tr>
</table>

## `TRIGS`

| Line | Content |
| ---: | ------- |
| [:1030](../api_names.txt#L1030) | `DAQmxErrors.CAN_EXPORT_ONLY_DIG_EDGE_TRIGS` |
| [:2572](../api_names.txt#L2572) | `DAQmxErrors.TWO_WAIT_FOR_TRIGS_AFTER_CONNECTION_IN_SCANLIST` |

<table>
<tr><td><b>Recommendations</b></td><td>Add <code>TRIGS</code> and <code>trigs</code> to the dictionary.</td></tr>
<tr><td><b>Rationale</b></td><td><code>Trig</code> is already in the approved DAQmx abbreviations list (<code>Trigger: Trig</code>). <code>TRIGS</code> and <code>trigs</code> are simply its plural inflection — the relationship between <em>trigger</em> and <em>triggers</em> is regular inflectional morphology (number). Approving the plural forms is a natural and minimal extension of the existing approved abbreviation.</td></tr>
</table>

## `trigs`

| Line | Content |
| ---: | ------- |
| [:4793](../api_names.txt#L4793) | `ReferenceTrigger.max_num_trigs_to_detect` |
| [:4841](../api_names.txt#L4841) | `StartTrigger.max_num_trigs_to_detect` |
| [:5373](../api_names.txt#L5373) | `Device.num_time_trigs` |

<table>
<tr><td><b>Recommendations</b></td><td>See <a href="#trigs-1"><code>TRIGS</code></a> above.</td></tr>
</table>

## `UNAVAIL`

| Line | Content |
| ---: | ------- |
| [:2180](../api_names.txt#L2180) | `DAQmxErrors.PROPERTY_UNAVAIL_WHEN_USING_ONBOARD_MEMORY` |

<table>
<tr><td><b>Recommendations</b></td><td>Deprecate <code>DAQmxErrors.PROPERTY_UNAVAIL_WHEN_USING_ONBOARD_MEMORY</code> and replace with <code>DAQmxErrors.PROPERTY_UNAVAILABLE_WHEN_USING_ONBOARD_MEMORY</code>.</td></tr>
<tr><td><b>Rationale</b></td><td>While <code>Available: Avail</code> is the approved DAQmx abbreviation and <code>AVAIL</code> is correctly used in three Python properties (<code>avail_samp_per_chan</code>, <code>read_all_avail_samp</code>, <code>space_avail</code>), the negated prefix form <code>UNAVAIL</code> appears only once in the API. The five other error codes that express unavailability all spell it out in full: <code>DEV_ABSENT_OR_UNAVAILABLE</code>, <code>SAMP_CLK_RATE_UNAVAILABLE</code>, <code>REF_TRIG_MASTER_SESSION_UNAVAILABLE</code>, <code>DIG_LINES_RESERVED_OR_UNAVAILABLE</code>, and <code>DEV_ABSENT_OR_UNAVAILABLE_ROUTING</code>. Renaming to <code>UNAVAILABLE</code> aligns with that dominant convention, requires no dictionary entry, and affects only this one error code.</td></tr>
</table>

## `zidx`

| Line | Content |
| ---: | ------- |
| [:4479](../api_names.txt#L4479) | `CIChannelCollection.add_ci_ang_encoder_chan(zidx_enable)` |
| [:4480](../api_names.txt#L4480) | `CIChannelCollection.add_ci_ang_encoder_chan(zidx_phase)` |
| [:4481](../api_names.txt#L4481) | `CIChannelCollection.add_ci_ang_encoder_chan(zidx_val)` |
| [:4523](../api_names.txt#L4523) | `CIChannelCollection.add_ci_lin_encoder_chan(zidx_enable)` |
| [:4524](../api_names.txt#L4524) | `CIChannelCollection.add_ci_lin_encoder_chan(zidx_phase)` |
| [:4525](../api_names.txt#L4525) | `CIChannelCollection.add_ci_lin_encoder_chan(zidx_val)` |

<table>
<tr><td><b>Recommendations</b></td><td>Rename the six <code>zidx_*</code> parameters to <code>z_index_*</code> in both <code>add_ci_ang_encoder_chan()</code> and <code>add_ci_lin_encoder_chan()</code>:<ul>
<li><code>zidx_enable</code> → <code>z_index_enable</code></li>
<li><code>zidx_phase</code> → <code>z_index_phase</code></li>
<li><code>zidx_val</code> → <code>z_index_val</code></li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td><code>zidx</code> fuses two separate concepts — <em>Z</em> (the encoder's Z channel, the once-per-revolution index pulse) and <em>index</em> — into a single compressed token. The approved DAQmx abbreviations list defines <code>Index: Index</code>, meaning <em>index</em> is always spelled in full with no approved abbreviation; <code>idx</code> is therefore non-standard. Splitting into <code>z_index</code> spells out both components correctly, requires no dictionary entry, and makes the parameter names immediately readable. No dictionary entry is needed for either <code>z</code> or <code>index</code>.</td></tr>
</table>

---

# Appendix: Additional Observations

## `GpsSignalType`

While analysing the `IRIGB` flag word, a broader naming question arose regarding the class `GpsSignalType` itself.

[PEP 8 — Naming Conventions](https://peps.python.org/pep-0008/#naming-conventions) states, under *Class Names*:

> "When using abbreviations in CapWords, capitalize all the letters of the abbreviation. Thus `HTTPServerError` is better than `HttpServerError`."

In the nidaqmx-python API, `GPS` is an initialism in exactly the same position as `HTTP` in PEP 8's example: it is an all-caps abbreviation embedded at the start of a CapWords class name. Applying the PEP 8 rule directly, `GPSSignalType` would be the conforming spelling, not `GpsSignalType`.

This observation is outside the scope of the cspell flag-word analysis (cspell does not flag `Gps`) but is worth recording as a related naming inconsistency.

## `ONBOARD` vs. `ON_BOARD`

While analysing the `onbrd` flag word, a broader inconsistency was found in how "onboard" is spelled across the API. Both forms are used, sometimes within the same enum:

| Form | Count | Examples |
| ---- | ----: | ------- |
| `ONBOARD` | 11 | `ONBOARD_MEM_TOO_SMALL`, `CAN_EXPORT_ONLY_ONBOARD_SAMP_CLK`, `SyncPulseType.ONBOARD`, `DeassertCondition.ONBOARD_MEMORY_CUSTOM_THRESHOLD` |
| `ON_BOARD` | 10 | `ON_BOARD_MEMORY_FULL`, `CANT_USE_ONLY_ON_BOARD_MEM_WITH_PROGRAMMED_IO`, `TIMING_ENGINE_DOES_NOT_SUPPORT_ON_BOARD_MEMORY` |

The inconsistency is particularly visible within individual enums: `DeassertCondition` contains both `ON_BOARD_MEMORY_FULL` and `ONBOARD_MEMORY_CUSTOM_THRESHOLD`; `InputDataTransferCondition` similarly contains both `ON_BOARD_MEMORY_MORE_THAN_HALF_FULL` and `ONBOARD_MEMORY_CUSTOM_THRESHOLD`.

<table>
<tr><td><b>Recommendation</b></td><td>Standardise on <code>ONBOARD</code> (joined). Deprecate the 10 <code>ON_BOARD_*</code> names and replace with their <code>ONBOARD_*</code> equivalents:<ul>
<li><code>DeassertCondition.ON_BOARD_MEMORY_FULL</code> → <code>DeassertCondition.ONBOARD_MEMORY_FULL</code></li>
<li><code>DeassertCondition.ON_BOARD_MEMORY_MORE_THAN_HALF_FULL</code> → <code>DeassertCondition.ONBOARD_MEMORY_MORE_THAN_HALF_FULL</code></li>
<li><code>InputDataTransferCondition.ON_BOARD_MEMORY_MORE_THAN_HALF_FULL</code> → <code>InputDataTransferCondition.ONBOARD_MEMORY_MORE_THAN_HALF_FULL</code></li>
<li><code>InputDataTransferCondition.ON_BOARD_MEMORY_NOT_EMPTY</code> → <code>InputDataTransferCondition.ONBOARD_MEMORY_NOT_EMPTY</code></li>
<li><code>OutputDataTransferCondition.ON_BOARD_MEMORY_EMPTY</code> → <code>OutputDataTransferCondition.ONBOARD_MEMORY_EMPTY</code></li>
<li><code>OutputDataTransferCondition.ON_BOARD_MEMORY_HALF_FULL_OR_LESS</code> → <code>OutputDataTransferCondition.ONBOARD_MEMORY_HALF_FULL_OR_LESS</code></li>
<li><code>OutputDataTransferCondition.ON_BOARD_MEMORY_LESS_THAN_FULL</code> → <code>OutputDataTransferCondition.ONBOARD_MEMORY_LESS_THAN_FULL</code></li>
<li><code>DAQmxErrors.CANT_USE_ONLY_ON_BOARD_MEM_WITH_PROGRAMMED_IO</code> → <code>DAQmxErrors.CANT_USE_ONLY_ONBOARD_MEM_WITH_PROGRAMMED_IO</code></li>
<li><code>DAQmxErrors.INSUFFICIENT_ON_BOARD_MEM_FOR_NUM_RECS_AND_SAMPS</code> → <code>DAQmxErrors.INSUFFICIENT_ONBOARD_MEM_FOR_NUM_RECS_AND_SAMPS</code></li>
<li><code>DAQmxErrors.TIMING_ENGINE_DOES_NOT_SUPPORT_ON_BOARD_MEMORY</code> → <code>DAQmxErrors.TIMING_ENGINE_DOES_NOT_SUPPORT_ONBOARD_MEMORY</code></li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>"Onboard" is a single dictionary word (adjective meaning "carried within the device"), not a two-word phrase, so <code>ONBOARD</code> is the more accurate spelling. It is also the form used when the word stands alone (<code>SyncPulseType.ONBOARD</code>) or leads a name (<code>ONBOARD_MEM_TOO_SMALL</code>), establishing it as the canonical form. cspell recognises <code>onboard</code> as a valid word natively; <code>on_board</code> requires cspell to parse it as two tokens.</td></tr>
</table>

## `PROP` and `PROPS` {#prop-and-props}

While analysing the `PRPTY` flag word, two additional abbreviated forms were found that cspell does not flag (because `prop` and `props` are valid English words in other contexts) but that are inconsistent with the rest of the API:

| Line | Content |
| ---: | ------- |
| [:2047](../api_names.txt#L2047) | `DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_CONFLICTING_PROP` |
| [:2048](../api_names.txt#L2048) | `DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_NOT_SUPPORTED_WITH_PROP_SET` |
| [:1008](../api_names.txt#L1008) | `DAQmxErrors.ASSOCIATED_CHANS_HAVE_CONFLICTING_PROPS` |

<table>
<tr><td><b>Recommendation</b></td><td>Deprecate all three and spell <em>property</em>/<em>properties</em> in full:<ul>
<li><code>DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_CONFLICTING_PROP</code> → <code>DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_CONFLICTING_PROPERTY</code></li>
<li><code>DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_NOT_SUPPORTED_WITH_PROP_SET</code> → <code>DAQmxErrors.MULTI_TASK_CFG_SAMP_RATE_NOT_SUPPORTED_WITH_PROPERTY_SET</code></li>
<li><code>DAQmxErrors.ASSOCIATED_CHANS_HAVE_CONFLICTING_PROPS</code> → <code>DAQmxErrors.ASSOCIATED_CHANS_HAVE_CONFLICTING_PROPERTIES</code></li>
</ul></td></tr>
<tr><td><b>Rationale</b></td><td>These three names use <code>PROP</code>/<code>PROPS</code> as an abbreviation for <em>property</em>/<em>properties</em>, a pattern that appears nowhere else in the API. The overwhelmingly dominant convention is to spell the word in full (<code>PROPERTY</code>: 45+ occurrences; <code>PROPERTIES</code>: 6 occurrences). cspell does not flag these because <em>prop</em> and <em>props</em> are ordinary English words, but the ambiguity is real — a reader scanning the API cannot immediately tell that <code>PROP</code> means <em>property</em> rather than something else. No dictionary change is required.</td></tr>
</table>
