<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->text($maxNbChars = 80) ,
            'gender' => $this->faker->randomElement($array = array ('men','women')),
            'img' => $this->faker->imageUrl($width = 640, $height = 480),
            'price' => $this->faker->randomFloat($nbMaxDecimals = 2, $min = 0, $max = 100),
            'category_id' => $this->faker->numberBetween($min = 1, $max = 9),
            'count' => $this->faker->numberBetween($min = 1, $max = 20),
            'sold' => $this->faker->numberBetween($min = 1, $max = 150),
            'description' => $this->faker->sentence($nbWords = 8, $variableNbWords = true),
            'code' => uniqid()
        ];
    }
}
