# Autogenerated wrapper script for libsamplerate_jll for i686-linux-musl
export libsamplerate, sndfile_resample

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libsamplerate`
const libsamplerate_splitpath = ["lib", "libsamplerate.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libsamplerate_path = ""

# libsamplerate-specific global declaration
# This will be filled out by __init__()
libsamplerate_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libsamplerate = "libsamplerate.so.0"


# Relative path to `sndfile_resample`
const sndfile_resample_splitpath = ["bin", "sndfile-resample"]

# This will be filled out by __init__() for all products, as it must be done at runtime
sndfile_resample_path = ""

# sndfile_resample-specific global declaration
function sndfile_resample(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(sndfile_resample_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"libsamplerate")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libsamplerate_path = normpath(joinpath(artifact_dir, libsamplerate_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libsamplerate_handle = dlopen(libsamplerate_path)
    push!(LIBPATH_list, dirname(libsamplerate_path))

    global sndfile_resample_path = normpath(joinpath(artifact_dir, sndfile_resample_splitpath...))

    push!(PATH_list, dirname(sndfile_resample_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

