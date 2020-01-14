
# XCrypto Tools

*Instructions and notes on building an experimental XCrypto enabled
toolchain and ISA simulator.*

---

## Getting Started

After first checking out the `xcrypto` repository:

- From the root of the project, run:
  ```sh
  source bin/conf.sh
  ```
  to setup the project workspace.

- Checkout the relevant repositories:
    ```sh
    ${REPO_HOME}/tools/clone-repos.sh
    ```
    This will clone GCC, Binutils, Newlib, the RISC-V Proxy kernel (PK)
    and the RISC-V ISA Simulator (Spike).

    It will then checkout known good commits on a new branch
    called `scarv/xcrypto/v$REPO_VERSION`, where `$REPO_VERSION` is set
    by the `xcrypto` environment setup script in `bin/conf.sh`.

- For each component in the tool-chain, execute the associated
  patch application, 
  configuration, 
  and 
  compilation (plus installation)
  script in turn:

  - `binutils`:

    ```sh
    ${REPO_HOME}/tools/binutils-apply.sh
    ${REPO_HOME}/tools/binutils-conf.sh
    ${REPO_HOME}/tools/binutils-build.sh
    ```

  - `gcc`:

    ```sh
    ${REPO_HOME}/tools/gcc-apply.sh
    ${REPO_HOME}/tools/gcc-conf.sh
    ${REPO_HOME}/tools/gcc-build.sh
    ```

  - `newlib`:

    ```sh
    ${REPO_HOME}/tools/newlib-apply.sh
    ${REPO_HOME}/tools/newlib-conf.sh
    ${REPO_HOME}/tools/newlib-build.sh
    ```

  - `pk` (the `spike` proxy kernel):

    ```sh
    ${REPO_HOME}/tools/pk-apply.sh
    ${REPO_HOME}/tools/pk-conf.sh
    ${REPO_HOME}/tools/pk-build.sh
    ``` 

  - `spike`:

    ```sh
    ${REPO_HOME}/tools/spike-apply.sh
    ${REPO_HOME}/tools/spike-conf.sh
    ${REPO_HOME}/tools/spike-build.sh
    ``` 




   - This will build `binutils`, `gcc`, `newlib`, `pk` and `spike`,
     and place the compiled results in `${REPO_HOME}/build/toolchain/install`.

   - You can go and make some tea / coffee for this bit, it will take a while.

   - The architecture the compiler will target is specified
     in `${REPO_HOME}/tools/share.sh` as
     `TARGET_ARCH, `ARCH_STRING` and `ABI_STRING`.

- To re-build a repository from scratch, first run the relevant
  `${REPO_HOME}/tools/conf-*.sh` script before running the corresponding
  `build` script.


## Development flow

This section describes the development flow for the `xcrypto`
toolchain and simulator patches.

- Assuming a fresh checkout of the `xcrypto` repository,
  run the [Getting Started](#Getting-Started) steps described above so that
  you have a working baseline toolchain installation.

  - Running these steps will apply the patches to `binutils`, `gcc` and
    `spike` from the corresponding `tools/patch-*.patch` file.

- There are three classes of tool script used to manage the patches:

  - The `tools/apply-patch-*.sh` scripts are used to take the patches
    contained in the XCrypto repository and apply them to the cloned
    upstream repositories.

  - The `tools/revert-patch-*.sh` scripts are used to put the cloned
    upstream repositories back to their known initial state.

  - The `tools/update-patch-*.sh` scripts take the *staged* modifications
    to the relevant repository and updates the XCrypto diff.

- To modify a patch:

  - When the upstream repositores are first cloned, all relevant patches
    are automatically applied.

  - If a change is made to a cloned repository, you must run `git add` to
    make sure the changes are *staged* for commit.
    *Do Not* commit your changes to the cloned repository.

  - Then, run the appropriate `tools/update-patch-*.sh` script and
    commit the change to the patch to the XCrypto repository.
