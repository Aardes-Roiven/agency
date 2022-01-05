<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Deal */

$this->title = 'Изменить сделку: ' . $model->contract_number;
$this->params['breadcrumbs'][] = ['label' => 'Сделки', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->contract_number, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Изменить';
?>
<div class="deal-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
