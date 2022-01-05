<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\controllers\EmployeeController;

/* @var $this yii\web\View */
/* @var $searchModel app\models\EmployeeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Сотрудники';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Создать сотрудника', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'specialization',
            [
                'attribute' => 'number',
                'content' => function($data){
                    return EmployeeController::beautifyNumber($data->number);
                },
            ],
            'email:email',
//            'login',
//            'password',
//            'senior_id',
//            'position_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
