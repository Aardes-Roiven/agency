<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Complex */

$this->title = 'Создать комплекс';
$this->params['breadcrumbs'][] = ['label' => 'Комплексы', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="complex-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
