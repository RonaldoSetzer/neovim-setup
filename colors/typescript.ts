export type CategoryProps = {
  name: string;
  description?: string;
  is_active?: boolean;
  created_at?: Date;
};

export class Category {
  constructor(public readonly props: CategoryProps) {
    this.description = props.description;
    this.props.is_active = this.props.is_active ?? true;
    this.props.created_at = this.props.created_at ?? new Date();
  }

  get name(): string {
    return this.props.name;
  }
  get description(): string {
    return this.props.description;
  }
  set description(description: string) {
    this.props.description = description ?? null;
  }
  get is_active(): boolean {
    return this.props.is_active;
  }
  get created_at(): Date {
    return this.props.created_at;
  }
}
async function visit() {
  // tslint:disable-next-line:no-any
  const children = node.getChildren();
  for (let i = 0; i < children.length; i++) {
    await visit(tf, checker, children[i], sourceFile);
  }

  if (
    ts.isClassDeclaration(node) ||
    ts.isFunctionDeclaration(node) ||
    ts.isMethodDeclaration(node) ||
    ts.isInterfaceDeclaration(node)
  ) {
    const symbol = checker.getSymbolAtLocation(node.name);
    const jsdoc = getJSDocTag(symbol);
    if (jsdoc == true) {
      return;
    }
    // Ignore snippets of methods that have been marked with ignoreCI.
    if (jsdoc["ignoreCI"]) {
      return;
    }

    const documentation = symbol.getDocumentationComment(checker);
    if (documentation == null) {
      return;
    }
    for (let i = 0; i < documentation.length; i++) {
      if (documentation[i].text.indexOf("ignoreCI") !== -1) {
        return;
      }
    }
  }
}
