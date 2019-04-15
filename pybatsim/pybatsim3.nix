{ stdenv, pythonPackages, procset }:

pythonPackages.buildPythonPackage rec {
    pname = "pybatsim";
    version = "3.1.0";

    src = pythonPackages.fetchPypi {
      inherit pname version;
      sha256 = "0dmqqk831zplrky114bf5j0p53l84x282zy7q219hzxv6jq0q2wg";
    };

    buildInputs = with pythonPackages; [
      autopep8
      coverage
      ipdb
    ];
    propagatedBuildInputs = with pythonPackages; [
      sortedcontainers
      pyzmq
      redis
      click
      pandas
      docopt
      procset
    ];

    doCheck = false;

    meta = with stdenv.lib; {
      homepage = "https://gitlab.inria.fr/batsim/pybatsim";
      description = "Python Schedulers for Batsim";
      license = licenses.lgpl3;
    };
}
