<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => 'pgsql:host=agency-postgres;port=5432;dbname=db',
    'username' => 'postgres',
    'password' => 'secret',
    'charset' => 'utf8',

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
