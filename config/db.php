<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => 'pgsql:host=172.24.0.3;port=5433;dbname=db',
    'username' => 'postgres',
    'password' => 'secret',
    'charset' => 'utf8',

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
