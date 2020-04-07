/**
* nz_worley3.scad
*
* @copyright Justin Lin, 2020
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-nz_worley3.html
*
**/

use <util/rand.scad>;
use <noise/_impl/_nz_worley3_impl.scad>;

function nz_worley3(x, y, z, seed, tile_w = 10, dist = "euclidean") =
    let(sd = is_undef(seed) ? floor(rand(0, 256)) : seed % 256)
    _nz_worley3([x, y, z], sd, tile_w, dist);