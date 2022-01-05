<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\controllers\DevController;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PropertyDevSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Застройщики';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="property-dev-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Добавить застройщика', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            [
                'attribute' => 'number',
                'content' => function($data){
                    return DevController::beautifyNumber($data->number);
                },
            ],
            'email:email',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
