<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RealEstateBuildingSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Здания';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="real-estate-building-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Добавить здание', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'address',
            [
                'attribute' => 'complex_id',
                'label' => 'Комплекс',
                'value' => 'complex.name',
            ],
            [
                'attribute' => 'dev_id',
                'label' => 'Застройщик',
                'value' => 'dev.name',
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
