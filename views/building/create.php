<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\RealEstateBuilding */

$this->title = 'Добавить здание';
$this->params['breadcrumbs'][] = ['label' => 'Здания', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="real-estate-building-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
