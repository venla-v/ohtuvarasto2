class Project:
    def __init__(self, name, description, li, authors, dependencies, dev_dependencies):
        self.name = name
        self.description = description
        self.li = li
        self.authors = authors
        self.dependencies = dependencies
        self.dev_dependencies = dev_dependencies

    def _stringify_dependencies(self, dependencies):
        return ", ".join(dependencies) if len(dependencies) > 0 else "-"

    def __str__(self):
        nl = '\n - '
        return (
            f"Name: {self.name}"
            f"\nDescription: {self.description or '-'}"
            f"\nLicense: {self.li or '-'}"
            f"\n"
            f"\nAuthors: \n - {nl.join(self.authors) or '-'}"
            f"\n"
            f"\nDependencies: \n - {nl.join(self.dependencies)}"
            f"\n"
            f"\nDevelopment dependencies: \n - {nl.join(self.dev_dependencies)}"
        )
