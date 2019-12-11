<?php

/**
 * Helper script that outputs set of supported BCL features.
 * 
 * ```json
 * {
 *  "phpversion": "7.4.0-rc",
 *  "extensions": ["Core", "Spl"],
 *  "ext-core": ["strlen", "Error", "PHP_VERSION"]
 * }
 * ```
 */
function collect() {

    $extensions = array_diff(get_loaded_extensions(), ["xdebug", "apc"]);

    $result = [
        "phpversion" => PHP_VERSION,
        "extensions" => $extensions,
    ];

    foreach ($extensions as $ext) {
        $re = new ReflectionExtension($ext);
        $result["ext-$ext"] = array_merge(array_keys($re->getFunctions()), $re->getClassNames());
    }

    //
    return $result;
}

echo json_encode(collect());
