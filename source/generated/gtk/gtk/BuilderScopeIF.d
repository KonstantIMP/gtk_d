module gtk.BuilderScopeIF;

private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkBuilderScope` is an interface to provide language binding support
 * to `GtkBuilder`.
 * 
 * The goal of `GtkBuilderScope` is to look up programming-language-specific
 * values for strings that are given in a `GtkBuilder` UI file.
 * 
 * The primary intended audience is bindings that want to provide deeper
 * integration of `GtkBuilder` into the language.
 * 
 * A `GtkBuilderScope` instance may be used with multiple `GtkBuilder` objects,
 * even at once.
 * 
 * By default, GTK will use its own implementation of `GtkBuilderScope`
 * for the C language which can be created via [ctor@Gtk.BuilderCScope.new].
 */
public interface BuilderScopeIF{
	/** Get the main Gtk struct */
	public GtkBuilderScope* getBuilderScopeStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_builder_scope_get_type();
	}
}
