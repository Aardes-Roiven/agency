<?php

use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\DetailView;
use app\controllers\EmployeeController;

/* @var $this yii\web\View */
/* @var $model app\models\Employee */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Сотрудники', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
?>
<div class="employee-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Изменить', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Удалить', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Вы уверены?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'name',
            'specialization',
            [
                'attribute' => 'number',
                'value' => function($data){
                    return EmployeeController::beautifyNumber($data->number);
                },
            ],
            'email:email',
            'login',
            'password',
            [
                'attribute' => 'Руководитель',
                'format' => 'raw',
                'value' => function ($model) {
                        return Html::tag(
                                'a', Html::encode($model->senior->name),
                                ['href' => Yii::$app->urlManager->createUrl(['employee/view', 'id' => $model->senior->id])]
                        );
                },
            ],
            [
                'attribute' => 'Должность',
                'format' => 'raw',
                'value' => function ($model) {
                    return Html::tag(
                        'a', Html::encode($model->position->name),
                        ['href' => Yii::$app->urlManager->createUrl(['position/view', 'id' => $model->position->id])]
                    );
                },
            ],
            [
                'attribute' => 'Подчинённые',
                'format' => 'raw',
                'value' => function ($model) {
                    if (count($model->employees) != 0) {
                        foreach ($model->employees as $employee) {
                            $string .= Html::tag(
                                    'a', Html::encode($employee->name),
                                    ['href' => Yii::$app->urlManager->createUrl(['employee/view', 'id' => $employee->id])]
                                ) . '<br>';
                        }
                        return $string;
                    } else return '-';
                },
            ]
        ],
    ]) ?>

</div>
