-- Shared build scripts from repo_build package.
repo_build = require("omni/repo/build")

-- Repo root
root = repo_build.get_abs_path(".")

-- Run repo_kit_tools premake5-kit that includes a bunch of Kit-friendly tooling configuration.
kit = require("_repo/deps/repo_kit_tools/kit-template/premake5-kit")
kit.setup_all()


-- Registries config for testing
repo_build.prebuild_copy {
    { "%{root}/tools/deps/user.toml", "%{root}/_build/deps/user.toml" },
}

repo_build.prebuild_copy {
    {"tools/isaacsim/data/python/shared/*",  "_build/%{platform}/%{config}"},
    {"tools/isaacsim/data/python/%{platform}/*",  "_build/%{platform}/%{config}"},
    {"tools/isaacsim/data/jupyter_kernel",  "_build/%{platform}/%{config}/jupyter_kernel"},
    {"tools/isaacsim/data/python_packages", "_build/%{platform}/%{config}/python_packages" },
}
-- Symlink extra files
repo_build.prebuild_link {
    {"source/standalone_examples", "_build/%{platform}/%{config}/standalone_examples" },
}

-- Isaac Sim default apps
define_app("isaacsim.exp.base.kit")
define_app("isaacsim.exp.base.xr.vr.kit")
define_app("isaacsim.exp.base.zero_delay.kit")
define_app("isaacsim.exp.full.fabric.kit")
define_app("isaacsim.exp.full.kit")
define_app("isaacsim.exp.full.streaming.kit")
