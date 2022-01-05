<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RealEstateObjectSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="real-estate-object-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'building_id') ?>

    <?= $form->field($model, 'local_address') ?>

    <?= $form->field($model, 'places') ?>

    <?= $form->field($model, 'price') ?>

    <?php // echo $form->field($model, 'area') ?>

    <?php // echo $form->field($model, 'floor') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'estate_type') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
