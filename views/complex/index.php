<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ComplexSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Комплексы';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="complex-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Добавить комплекс', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'type',
            'comfort_class',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
