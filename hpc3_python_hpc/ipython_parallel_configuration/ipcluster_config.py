# Configuration file for ipcluster.

c = get_config()

# The timeout (in seconds)
c.IPClusterStart.early_shutdown = 90

c.IPClusterEngines.engine_launcher_class = 'PBSEngineSetLauncher'

#------------------------------------------------------------------------------
# PBSEngineSetLauncher configuration
#------------------------------------------------------------------------------

import os.path
home_folder = os.path.expanduser('~') 
c.PBSEngineSetLauncher.batch_template_file = home_folder + '/.ipython/profile_default/slurm.engine.template'

# The PBS submit command ['qsub']
c.PBSEngineSetLauncher.submit_command = ['sbatch']
