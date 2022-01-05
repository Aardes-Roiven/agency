<?php

use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Deal */

$this->title = $model->contract_number;
$this->params['breadcrumbs'][] = ['label' => 'Сделки', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
?>
<div class="deal-view">

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
            [
                    'attribute' => 'object',
                'label' => 'Идентификатор объекта недвижимости',
                'format' => 'raw',
                'value' => function ($model) {
                    return Html::tag(
                        'a', Html::encode($model->realEstateObj->id),
                        ['href' => Yii::$app->urlManager->createUrl(['object/view', 'id' => $model->realEstateObj->id])]
                    );
                },
            ],
            [
                'attribute' => 'client',
                'label' => 'Клиент-потребитель',
                'format' => 'raw',
                'value' => function ($model) {
                    return Html::tag(
                        'a', Html::encode($model->client->name),
                        ['href' => Yii::$app->urlManager->createUrl(['client/view', 'id' => $model->client->id])]
                    );
                },
            ],
            [
                'attribute' => 'Брокеры',
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
            ],
            'type',
            'status',
            'contract_number',
        ],
    ]) ?>

</div>
