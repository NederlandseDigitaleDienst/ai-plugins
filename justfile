# Generate the per-tool marketplace files from marketplace.json
generate:
    uv run python .github/scripts/generate_marketplace.py

# Verify the generated files match marketplace.json
check:
    uv run python .github/scripts/generate_marketplace.py --check

# Run the generator tests
test:
    uv run --with pytest pytest .github/scripts
