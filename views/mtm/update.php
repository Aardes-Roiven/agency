<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\MtmEmployeeDeal */

$this->title = 'Изменить зависимость: ' . $model->deal_id;
$this->params['breadcrumbs'][] = ['label' => 'Клиенты-сделки', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->deal_id, 'url' => ['view', 'deal_id' => $model->deal_id, 'employee_id' => $model->employee_id]];
$this->params['breadcrumbs'][] = 'Изменить';
?>
<div class="mtm-employee-deal-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
