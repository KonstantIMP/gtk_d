module sourceview.SnippetContext;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import sourceview.c.functions;
public  import sourceview.c.types;
private import std.algorithm;


/** */
public class SnippetContext : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceSnippetContext* gtkSourceSnippetContext;

	/** Get the main Gtk struct */
	public GtkSourceSnippetContext* getSnippetContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceSnippetContext;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceSnippetContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceSnippetContext* gtkSourceSnippetContext, bool ownedRef = false)
	{
		this.gtkSourceSnippetContext = gtkSourceSnippetContext;
		super(cast(GObject*)gtkSourceSnippetContext, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_snippet_context_get_type();
	}

	/**
	 * Creates a new #GtkSourceSnippetContext.
	 *
	 * Generally, this isn't needed unless you are controlling the
	 * expansion of snippets manually.
	 *
	 * Returns: a #GtkSourceSnippetContext
	 *
	 * Since: 5.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_source_snippet_context_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceSnippetContext*) __p, true);
	}

	/**
	 * Removes all variables from the context.
	 *
	 * Since: 5.0
	 */
	public void clearVariables()
	{
		gtk_source_snippet_context_clear_variables(gtkSourceSnippetContext);
	}

	/** */
	public string expand(string input)
	{
		auto retStr = gtk_source_snippet_context_expand(gtkSourceSnippetContext, Str.toStringz(input));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the current value for a variable named @key.
	 *
	 * Params:
	 *     key = the name of the variable
	 *
	 * Returns: the value for the variable, or %NULL
	 *
	 * Since: 5.0
	 */
	public string getVariable(string key)
	{
		return Str.toString(gtk_source_snippet_context_get_variable(gtkSourceSnippetContext, Str.toStringz(key)));
	}

	/**
	 * Sets a constatnt within the context. This is similar to
	 * a variable set with gtk_source_snippet_context_set_variable()
	 * but is expected to not change during use of the snippet.
	 *
	 * Examples would be the date or users name.
	 *
	 * Params:
	 *     key = the constant name
	 *     value = the value of the constant
	 *
	 * Since: 5.0
	 */
	public void setConstant(string key, string value)
	{
		gtk_source_snippet_context_set_constant(gtkSourceSnippetContext, Str.toStringz(key), Str.toStringz(value));
	}

	/** */
	public void setLinePrefix(string linePrefix)
	{
		gtk_source_snippet_context_set_line_prefix(gtkSourceSnippetContext, Str.toStringz(linePrefix));
	}

	/** */
	public void setTabWidth(int tabWidth)
	{
		gtk_source_snippet_context_set_tab_width(gtkSourceSnippetContext, tabWidth);
	}

	/** */
	public void setUseSpaces(bool useSpaces)
	{
		gtk_source_snippet_context_set_use_spaces(gtkSourceSnippetContext, useSpaces);
	}

	/**
	 * Sets a variable within the context.
	 *
	 * This variable may be overridden by future updates to the
	 * context.
	 *
	 * Params:
	 *     key = the variable name
	 *     value = the value for the variable
	 *
	 * Since: 5.0
	 */
	public void setVariable(string key, string value)
	{
		gtk_source_snippet_context_set_variable(gtkSourceSnippetContext, Str.toStringz(key), Str.toStringz(value));
	}

	/**
	 * The "changed" signal is emitted when a change has been
	 * discovered in one of the chunks of the snippet which has
	 * caused a variable or other dynamic data within the context
	 * to have changed.
	 *
	 * Since: 5.0
	 */
	gulong addOnChanged(void delegate(SnippetContext) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
