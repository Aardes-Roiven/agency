<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Complex */

$this->title = 'Изменить комплекс: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Комплексы', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Изменить';
?>
<div class="complex-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
