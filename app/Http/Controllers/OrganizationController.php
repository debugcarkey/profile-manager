<?php
namespace App\Http\Controllers;

class OrganizationController extends Controller
{
    /**
     * @OA\Get(
     *     path="/organizations/{slug}/",
     *     operationId="/sample/category/things",
     *     tags={"yourtag"},
     *     @OA\Parameter(
     *         name="slug",
     *         in="path",
     *         description="The organization slug in path",
     *         required=true,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="Returns some sample category things",
     *         @OA\JsonContent()
     *     ),
     *     @OA\Response(
     *         response="400",
     *         description="Error: Bad request. When required parameters were not supplied.",
     *     ),
     * )
     */
    public function show()
    {
        return response()->json(['name' => 'Pegotec', 'country' => 'Combodia','env'=>env('DB_PASSWORD')]);
    }
}