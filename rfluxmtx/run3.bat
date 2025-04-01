echo ::Generating scene octree::
oconv mat.rad geo.rad > scene.oct

echo ::Running rfluxmtx for direct sun::
rfluxmtx -V+ -ab 0 -t 5 -dj 0 sender.rad receivers3.rad -i scene.oct > dirr.mtx

echo ::Converting direct sun results to irradiance::
rmtxop -faa -c 0.333333333 0.333333333 0.333333334 -t dirr.mtx > dirrFin.txt

echo ::Running rfluxmtx for combined (diffuse + direct) sun simulations::
rfluxmtx -V+ -ab 6 -ad 25000 -lw 4.0000e-05 -t 5 -dj 0 sender.rad receivers3.rad -i scene.oct > tot.mtx

echo ::Converting total sun results to irradiance::
rmtxop -faa -c 0.333333333 0.333333333 0.333333334 -t tot.mtx > totFin.txt

echo ::Simulation(s) complete::