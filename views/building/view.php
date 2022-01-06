<?php

use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\RealEstateBuilding */

$this->title = $model->address;
$this->params['breadcrumbs'][] = ['label' => 'Здания', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
?>
<div class="real-estate-building-view">

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
            'address',
            [
                'attribute' => 'Комплекс',
                'format' => 'raw',
                'value' => function ($model) {
                    return Html::tag(
                        'a', Html::encode($model->complex->name),
                        ['href' => Yii::$app->urlManager->createUrl(['complex/view', 'id' => $model->complex->id])]
                    );
                },
            ],
            [
                'attribute' => 'Застройщик',
                'format' => 'raw',
                'value' => function ($model) {
                    return Html::tag(
                        'a', Html::encode($model->dev->name),
                        ['href' => Yii::$app->urlManager->createUrl(['dev/view', 'id' => $model->dev->id])]
                    );
                },
            ],
            'floor_count',
            [
                'attribute' => 'Объекты',
                'format' => 'raw',
                'value' => function ($model) {
                    if (count($model->realEstateObjects) != 0) {
                        foreach ($model->realEstateObjects as $object) {
                            $string .= Html::tag(
                                    'a', Html::encode($object->local_address),
                                    ['href' => Yii::$app->urlManager->createUrl(['object/view', 'id' => $object->id])]
                                ) . '<br>';
                        }
                        return $string;
                    } else return '-';
                },
            ]
        ],
    ]) ?>

</div>
