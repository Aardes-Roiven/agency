<?php

use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Complex */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Комплексы', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
?>
<div class="complex-view">

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
            'type',
            'comfort_class',
            [
                'attribute' => 'Здания',
                'format' => 'raw',
                'value' => function ($model) {
                    if (count($model->realEstateBuildings) != 0) {
                        foreach ($model->realEstateBuildings as $building) {
                            $string .= Html::tag(
                                    'a', Html::encode($building->address),
                                    ['href' => Yii::$app->urlManager->createUrl(['building/view', 'id' => $building->id])]
                                ) . '<br>';
                        }
                        return $string;
                    } else return '-';
                },
            ]
        ],
    ]) ?>

</div>
