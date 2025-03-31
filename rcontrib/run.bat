echo ::Generating scene octree::
oconv mat.rad geo.rad sunLights.rad > scene.oct

echo ::Running rcontrib for direct sun::
rcontrib -I+ -V+ -ab 0 -y 25 -t 5 -dc 1 -dt 0 -dj 0 -faa -M sunNames.txt scene.oct < sensors.txt > dirr.mtx

echo ::Converting direct sun results to irradiance::
rmtxop -faa -c 0.333333333 0.333333333 0.333333334 -t dirr.mtx > dirrFin.txt

echo ::Running rcontrib for combined (diffuse + direct) sun simulations::
rcontrib -I+ -V+ -ab 6 -ad 25000 -lw 4.0000e-05 -y 25 -t 5 -dc 1 -dt 0 -dj 0 -faa -M sunNames.txt scene.oct < sensors.txt > tot.mtx

echo ::Converting total sun results to irradiance::
rmtxop -faa -c 0.333333333 0.333333333 0.333333334 -t tot.mtx > totFin.txt

echo ::Simulation(s) complete::