<?php

/**
 * Helper script that outputs set of supported BCL features.
 * 
 * ```json
 * {
 *  "version": "7.4.0-rc",
 *  "extensions": ["Core", "Spl"],
 *  "ext-core": ["strlen", "Error", "PHP_VERSION"]
 * }
 * ```
 */
function collect() {

    $extensions = array_diff(get_loaded_extensions(), ["xdebug", "apc"]);

    $result = [
        "version" => defined("PEACHPIE_VERSION") ? PEACHPIE_VERSION : PHP_VERSION,
        "extensions" => $extensions,
    ];

    foreach ($extensions as $ext) {
        $re = new ReflectionExtension($ext);
        $set = [];

        foreach ($re->getFunctions() as $f => $_) {
            $set[] = "function $f";
        }

        foreach ($re->getClasses() as $c) {
            /** @var ReflectionClass $c */
            $set[] = "class $c->name";
            
            foreach ($c->getMethods(ReflectionMethod::IS_PUBLIC) as $m) {
                /** @var ReflectionMethod $m */
                $set[] = "function $c->name::$m->name";
            }
        }

        //
        $result["ext-$ext"] = $set;
    }

    //
    return $result;
}

echo json_encode(collect());
