<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\RealEstateObject */

$this->title = 'Добавить объект недвижимости';
$this->params['breadcrumbs'][] = ['label' => 'Объекты недвижимости', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="real-estate-object-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
