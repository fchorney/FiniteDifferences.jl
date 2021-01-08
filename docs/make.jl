using Documenter, FiniteDifferences

# Copy the README.
repo_root = dirname(dirname(@__FILE__))
cp(
    joinpath(repo_root, "README.md"),
    joinpath(repo_root, "docs", "src", "index.md");
    # `index.md` will already exist, so we set `force=true` to overwrite it.
    force=true
)

makedocs(
    modules=[FiniteDifferences],
    format=Documenter.HTML(prettyurls=get(ENV, "CI", nothing) == "true"),
    pages=["Home" => "index.md", "API" => "pages/api.md"],
    authors="Invenia Labs",
    checkdocs=:exports,
    repo="https://github.com/JuliaDiff/FiniteDifferences.jl/blob/{commit}{path}#L{line}",
    sitename="FiniteDifferences.jl",
    strict=true,
)

deploydocs(repo="github.com/JuliaDiff/FiniteDifferences.jl.git")
