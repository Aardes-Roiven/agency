<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Client */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Клиенты', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
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
            ['attribute' => 'id', 'label' => 'Идентификатор'],
            ['attribute' => 'name', 'label' => 'Имя'],
            ['attribute' => 'status', 'label' => 'Статус'],
            ['attribute' => 'number', 'label' => 'Контактный номер телефона'],
            ['attribute' => 'email', 'label' => 'Контактная электронная почта'],
            ['attribute' => 'contract_number', 'label' => 'Номер юридического договора'],
        ],
    ]) ?>

</div>
