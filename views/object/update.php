<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\RealEstateObject */

$this->title = 'Изменить объект недвижимости: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Объекты недвижимости', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Изменить';
?>
<div class="real-estate-object-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
