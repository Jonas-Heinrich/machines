installPlugins() {
	# Install extensions
	# Formats
	code --install-extension redhat.vscode-yaml
	code --install-extension ms-azuretools.vscode-docker
	code --install-extension DavidAnson.vscode-markdownlint
	code --install-extension mauve.terraform
	# Languages
	code --install-extension ms-python.python
	code --install-extension ms-vscode.Go
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension rust-lang.rust
	# Themes
	code --install-extension PKief.material-icon-theme
	code --install-extension esbenp.prettier-vscode
	# Other
	code --install-extension christian-kohler.path-intellisense
}

installPlugins
