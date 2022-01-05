<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RealEstateObjectSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Объекты недвижимости';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="real-estate-object-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Добавить объект недвижимости', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

            'id',
//            'building_id',
//            'local_address',
            'places',
            [
                'attribute' => 'price',
                'content' => function ($model) {
                    return strtr($model->price, array('$' => '₽'));
                },
            ],
//            'area',
//            'floor',
            'type',
            'estate_type',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
