<?php

use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\DetailView;
use app\controllers\ClientController;

/* @var $this yii\web\View */
/* @var $model app\models\Client */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Клиенты', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
?>
<div class="client-view">

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
            'status',
            [
                'attribute' => 'number',
                'value' => function($data){
                    return ClientController::beautifyNumber($data->number);
                },
            ],
            'email:email',
            [
                'attribute' => 'Сделки',
                'format' => 'raw',
                'value' => function ($model) {
                    if (count($model->deals) != 0) {
                        foreach ($model->deals as $deal) {
                            $string .= Html::tag(
                                    'a', Html::encode($deal->contract_number),
                                    ['href' => Yii::$app->urlManager->createUrl(['deal/view', 'id' => $deal->id])]
                                ) . '<br>';
                        }
                        return $string;
                    } else return '-';
                },
            ]
        ],
    ]) ?>

</div>
