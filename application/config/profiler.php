<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| Profiler Sections
| -------------------------------------------------------------------------
| This file lets you determine whether or not various sections of Profiler
| data are displayed when the Profiler is enabled.
| Please see the user guide for info:
|
|	https://codeigniter.com/userguide3/general/profiling.html
|
*/
$sections = array(
        'benchmarks'            => TRUE,
        'config'                => FALSE,
        'controller_info'       => TRUE,
        'get'                   => TRUE,
        'http_headers'          => FALSE,
        'memory_usage'          => TRUE,
        'post'                  => TRUE,
        'queries'               => FALSE,
        'uri_string'            => TRUE,
        'session_data'          => TRUE,
        // 'query_toggle_count' => FALSE,
);

$this->output->set_profiler_sections($sections);