<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\MtmEmployeeDeal */

$this->title = 'Создать новую зависимость';
$this->params['breadcrumbs'][] = ['label' => 'Клинты-сделки', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="mtm-employee-deal-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
