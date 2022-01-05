<?php

use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\RealEstateObject */

$this->title = 'Объект недвижимости № ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Объекты недвижимости', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
?>
<div class="real-estate-object-view">

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
                'attribute' => 'Адрес здания',
                'format' => 'raw',
                'value' => function ($model) {
                    return Html::tag(
                        'a', Html::encode($model->building->address),
                        ['href' => Yii::$app->urlManager->createUrl(['building/view', 'id' => $model->building->id])]
                    );
                },
            ],
            'local_address',
            'places',
            [
                'attribute' => 'price',
                'label' => 'Стоимость',
                'value' => function ($model){
                    return strtr($model->price, array('$' => '₽'));
                },
            ],
            'area',
            'floor',
            'type',
            'estate_type',
            [
                'attribute' => 'Статус',
                'format' => 'raw',
                'value' => function ($model) {
                    if ($model->deal != 0){
                        return Html::tag(
                            'a', Html::encode('занят'),
                            ['href' => Yii::$app->urlManager->createUrl(['deal/view', 'id' => $model->deal->id])]
                        );
                    } else return Html::encode('свободен');
                },
            ],
        ],
    ]) ?>

</div>
