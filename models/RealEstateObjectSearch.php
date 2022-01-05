<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\RealEstateObject;

/**
 * RealEstateObjectSearch represents the model behind the search form of `app\models\RealEstateObject`.
 */
class RealEstateObjectSearch extends RealEstateObject
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'building_id', 'places', 'area', 'floor'], 'integer'],
            [['local_address', 'type', 'estate_type'], 'safe'],
            [['price'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = RealEstateObject::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'building_id' => $this->building_id,
            'places' => $this->places,
            'price' => $this->price,
            'area' => $this->area,
            'floor' => $this->floor,
        ]);

        $query->andFilterWhere(['ilike', 'local_address', $this->local_address])
            ->andFilterWhere(['ilike', 'type', $this->type])
            ->andFilterWhere(['ilike', 'estate_type', $this->estate_type]);

        return $dataProvider;
    }
}
