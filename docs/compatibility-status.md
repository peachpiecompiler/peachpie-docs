!!! tip "PeachPie 1.0.0-dev+ad7ef58ace017a4d894a3e4a4d6f012b693304e8 vs. PHP 7.4.0beta4"
    Following table compares defined extensions, functions and classes of a regular `php` against `peachpie`. Missing features are listed below each progress bar.

---

??? tiny "[=70% "**extensions** 28 / 40"]"
    - `bcmath`
    - `calendar`
    - `readline`
    - `mysqlnd`
    - `openssl`
    - `xmlreader`
    - `xmlwriter`
    - `gettext`
    - `xmlrpc`
    - `soap`
    - `imap`
    - `tidy`


??? tiny "[=100% "**json** 6 / 6"]"
    happy face
??? tiny "[=89% "**standard** 485 / 544"]"
    - `time_nanosleep`
    - `time_sleep_until`
    - `phpcredits`
    - `vfprintf`
    - `getservbyname`
    - `getservbyport`
    - `getprotobyname`
    - `getprotobynumber`
    - `getmygid`
    - `getmyinode`
    - `password_algos`
    - `convert_uuencode`
    - `convert_uudecode`
    - `intdiv`
    - `getrusage`
    - `hrtime`
    - `debug_zval_dump`
    - `register_tick_function`
    - `unregister_tick_function`
    - `highlight_file`
    - `show_source`
    - `highlight_string`
    - `restore_include_path`
    - `net_get_interfaces`
    - `dns_check_record`
    - `checkdnsrr`
    - `dns_get_record`
    - `stream_context_get_params`
    - `stream_context_get_default`
    - `stream_context_set_default`
    - `stream_filter_remove`
    - `stream_socket_enable_crypto`
    - `stream_socket_shutdown`
    - `stream_socket_pair`
    - `stream_supports_lock`
    - `stream_isatty`
    - `sapi_windows_vt100_support`
    - `get_meta_tags`
    - `stream_set_read_buffer`
    - `stream_set_chunk_size`
    - `stream_wrapper_unregister`
    - `stream_wrapper_restore`
    - `realpath_cache_size`
    - `realpath_cache_get`
    - `openlog`
    - `syslog`
    - `closelog`
    - `assert`
    - `ftok`
    - `output_add_rewrite_var`
    - `output_reset_rewrite_vars`
    - `sapi_windows_cp_set`
    - `sapi_windows_cp_get`
    - `sapi_windows_cp_is_utf8`
    - `sapi_windows_cp_conv`
    - `sapi_windows_set_ctrl_handler`
    - `sapi_windows_generate_ctrl_event`
    - `cli_set_process_title`
    - `cli_get_process_title`
??? tiny "[=96% "**session** 26 / 27"]"
    - `SessionIdInterface`
??? tiny "[=100% "**zip** 11 / 11"]"
    happy face
??? tiny "[=81% "**date** 44 / 54"]"
    - `date_parse_from_format`
    - `date_time_set`
    - `date_date_set`
    - `date_isodate_set`
    - `date_timestamp_get`
    - `timezone_name_get`
    - `timezone_name_from_abbr`
    - `date_interval_format`
    - `date_sun_info`
    - `DatePeriod`
??? tiny "[=100% "**phar** 4 / 4"]"
    happy face
??? tiny "[=88% "**Reflection** 15 / 17"]"
    - `ReflectionClassConstant`
    - `ReflectionZendExtension`
??? tiny "[=87% "**Core** 68 / 78"]"
    - `get_mangled_object_vars`
    - `get_resources`
    - `gc_status`
    - `CompileError`
    - `ParseError`
    - `ArgumentCountError`
    - `ArithmeticError`
    - `DivisionByZeroError`
    - `ClosedGeneratorException`
    - `WeakReference`
??? tiny "[=100% "**SPL** 70 / 70"]"
    happy face
??? tiny "[=88% "**libxml** 7 / 8"]"
    - `libxml_set_external_entity_loader`
??? tiny "[=50% "**mysqli** 55 / 110"]"
    - `mysqli_autocommit`
    - `mysqli_begin_transaction`
    - `mysqli_change_user`
    - `mysqli_commit`
    - `mysqli_dump_debug_info`
    - `mysqli_debug`
    - `mysqli_error_list`
    - `mysqli_execute`
    - `mysqli_fetch_lengths`
    - `mysqli_fetch_all`
    - `mysqli_field_count`
    - `mysqli_get_connection_stats`
    - `mysqli_get_client_stats`
    - `mysqli_get_charset`
    - `mysqli_get_links_stats`
    - `mysqli_get_proto_info`
    - `mysqli_get_warnings`
    - `mysqli_info`
    - `mysqli_kill`
    - `mysqli_multi_query`
    - `mysqli_poll`
    - `mysqli_report`
    - `mysqli_real_query`
    - `mysqli_reap_async_query`
    - `mysqli_release_savepoint`
    - `mysqli_rollback`
    - `mysqli_savepoint`
    - `mysqli_stmt_attr_get`
    - `mysqli_stmt_attr_set`
    - `mysqli_stmt_bind_result`
    - `mysqli_stmt_errno`
    - `mysqli_stmt_error`
    - `mysqli_stmt_error_list`
    - `mysqli_stmt_fetch`
    - `mysqli_stmt_field_count`
    - `mysqli_stmt_free_result`
    - `mysqli_stmt_get_warnings`
    - `mysqli_stmt_init`
    - `mysqli_stmt_more_results`
    - `mysqli_stmt_next_result`
    - `mysqli_stmt_num_rows`
    - `mysqli_stmt_param_count`
    - `mysqli_stmt_reset`
    - `mysqli_stmt_result_metadata`
    - `mysqli_stmt_store_result`
    - `mysqli_stmt_sqlstate`
    - `mysqli_sqlstate`
    - `mysqli_stat`
    - `mysqli_store_result`
    - `mysqli_thread_safe`
    - `mysqli_use_result`
    - `mysqli_warning_count`
    - `mysqli_refresh`
    - `mysqli_set_opt`
    - `mysqli_driver`
??? tiny "[=73% "**curl** 24 / 33"]"
    - `curl_copy_handle`
    - `curl_strerror`
    - `curl_share_strerror`
    - `curl_reset`
    - `curl_pause`
    - `curl_share_init`
    - `curl_share_close`
    - `curl_share_setopt`
    - `curl_share_errno`
??? tiny "[=80% "**pdo** 4 / 5"]"
    - `PDORow`
??? tiny "[=80% "**simplexml** 4 / 5"]"
    - `SimpleXMLIterator`
??? tiny "[=100% "**ctype** 11 / 11"]"
    happy face
??? tiny "[=100% "**tokenizer** 2 / 2"]"
    happy face
??? tiny "[=90% "**pcre** 9 / 10"]"
    - `preg_filter`
??? tiny "[=62% "**hash** 13 / 21"]"
    - `hash_hmac_algos`
    - `hash_hkdf`
    - `mhash_keygen_s2k`
    - `mhash_get_block_size`
    - `mhash_get_hash_name`
    - `mhash_count`
    - `mhash`
    - `HashContext`
??? tiny "[=100% "**filter** 7 / 7"]"
    happy face
??? tiny "[=70% "**iconv** 7 / 10"]"
    - `iconv_mime_encode`
    - `iconv_mime_decode`
    - `iconv_mime_decode_headers`
??? tiny "[=45% "**mbstring** 33 / 73"]"
    - `mb_output_handler`
    - `mb_strrichr`
    - `mb_encoding_aliases`
    - `mb_convert_kana`
    - `mb_encode_mimeheader`
    - `mb_decode_mimeheader`
    - `mb_encode_numericentity`
    - `mb_decode_numericentity`
    - `mb_ord`
    - `mb_chr`
    - `mb_scrub`
    - `mb_regex_set_options`
    - `mb_ereg`
    - `mb_eregi`
    - `mb_ereg_replace`
    - `mb_eregi_replace`
    - `mb_ereg_replace_callback`
    - `mb_split`
    - `mb_ereg_match`
    - `mb_ereg_search`
    - `mb_ereg_search_pos`
    - `mb_ereg_search_regs`
    - `mb_ereg_search_init`
    - `mb_ereg_search_getregs`
    - `mb_ereg_search_getpos`
    - `mb_ereg_search_setpos`
    - `mbregex_encoding`
    - `mbereg`
    - `mberegi`
    - `mbereg_replace`
    - `mberegi_replace`
    - `mbsplit`
    - `mbereg_match`
    - `mbereg_search`
    - `mbereg_search_pos`
    - `mbereg_search_regs`
    - `mbereg_search_init`
    - `mbereg_search_getregs`
    - `mbereg_search_getpos`
    - `mbereg_search_setpos`
??? tiny "[=95% "**xml** 21 / 22"]"
    - `xml_set_unparsed_entity_decl_handler`
??? tiny "[=74% "**zlib** 23 / 31"]"
    - `zlib_encode`
    - `zlib_decode`
    - `deflate_init`
    - `deflate_add`
    - `inflate_init`
    - `inflate_add`
    - `inflate_get_status`
    - `inflate_get_read_len`
??? tiny "[=61% "**gd** 66 / 108"]"
    - `imagechar`
    - `imagecharup`
    - `imagepalettecopy`
    - `imagecolorclosest`
    - `imagecolorclosesthwb`
    - `imagecolordeallocate`
    - `imagecopymergegray`
    - `imagepalettetotruecolor`
    - `imagesetthickness`
    - `imagecolorclosestalpha`
    - `imagegrabwindow`
    - `imagegrabscreen`
    - `imageflip`
    - `imagecrop`
    - `imagecropauto`
    - `imagescale`
    - `imageaffine`
    - `imageaffinematrixconcat`
    - `imageaffinematrixget`
    - `imagesetinterpolation`
    - `imagesetbrush`
    - `imagesetstyle`
    - `imagecreatefromwebp`
    - `imagecreatefrombmp`
    - `imagecreatefromtga`
    - `imagewebp`
    - `imagewbmp`
    - `imagebmp`
    - `imagegammacorrect`
    - `imagefilltoborder`
    - `imageloadfont`
    - `imageopenpolygon`
    - `imagestringup`
    - `imagesetclip`
    - `imagegetclip`
    - `imagedashedline`
    - `imagefttext`
    - `jpeg2wbmp`
    - `png2wbmp`
    - `imagelayereffect`
    - `imagexbm`
    - `imageresolution`
??? tiny "[=100% "**exif** 5 / 5"]"
    happy face
