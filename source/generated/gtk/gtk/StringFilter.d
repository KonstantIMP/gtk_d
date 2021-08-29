module gtk.StringFilter;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.Expression;
private import gtk.Filter;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkStringFilter` determines whether to include items by comparing
 * strings to a fixed search term.
 * 
 * The strings are obtained from the items by evaluating a `GtkExpression`
 * set with [method@Gtk.StringFilter.set_expression], and they are
 * compared against a search term set with [method@Gtk.StringFilter.set_search].
 * 
 * `GtkStringFilter` has several different modes of comparison - it
 * can match the whole string, just a prefix, or any substring. Use
 * [method@Gtk.StringFilter.set_match_mode] choose a mode.
 * 
 * It is also possible to make case-insensitive comparisons, with
 * [method@Gtk.StringFilter.set_ignore_case].
 */
public class StringFilter : Filter
{
	/** the main Gtk struct */
	protected GtkStringFilter* gtkStringFilter;

	/** Get the main Gtk struct */
	public GtkStringFilter* getStringFilterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkStringFilter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkStringFilter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkStringFilter* gtkStringFilter, bool ownedRef = false)
	{
		this.gtkStringFilter = gtkStringFilter;
		super(cast(GtkFilter*)gtkStringFilter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_string_filter_get_type();
	}

	/**
	 * Creates a new string filter.
	 *
	 * You will want to set up the filter by providing a string to search for
	 * and by providing a property to look up on the item.
	 *
	 * Params:
	 *     expression = The expression to evaluate
	 *
	 * Returns: a new `GtkStringFilter`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Expression expression)
	{
		auto __p = gtk_string_filter_new((expression is null) ? null : expression.getExpressionStruct(true));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkStringFilter*) __p, true);
	}

	/**
	 * Gets the expression that the string filter uses to
	 * obtain strings from items.
	 *
	 * Returns: a `GtkExpression`
	 */
	public Expression getExpression()
	{
		auto __p = gtk_string_filter_get_expression(gtkStringFilter);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Expression)(cast(GtkExpression*) __p);
	}

	/**
	 * Returns whether the filter ignores case differences.
	 *
	 * Returns: %TRUE if the filter ignores case
	 */
	public bool getIgnoreCase()
	{
		return gtk_string_filter_get_ignore_case(gtkStringFilter) != 0;
	}

	/**
	 * Returns the match mode that the filter is using.
	 *
	 * Returns: the match mode of the filter
	 */
	public GtkStringFilterMatchMode getMatchMode()
	{
		return gtk_string_filter_get_match_mode(gtkStringFilter);
	}

	/**
	 * Gets the search term.
	 *
	 * Returns: The search term
	 */
	public string getSearch()
	{
		return Str.toString(gtk_string_filter_get_search(gtkStringFilter));
	}

	/**
	 * Sets the expression that the string filter uses to
	 * obtain strings from items.
	 *
	 * The expression must have a value type of %G_TYPE_STRING.
	 *
	 * Params:
	 *     expression = a `GtkExpression`
	 */
	public void setExpression(Expression expression)
	{
		gtk_string_filter_set_expression(gtkStringFilter, (expression is null) ? null : expression.getExpressionStruct());
	}

	/**
	 * Sets whether the filter ignores case differences.
	 *
	 * Params:
	 *     ignoreCase = %TRUE to ignore case
	 */
	public void setIgnoreCase(bool ignoreCase)
	{
		gtk_string_filter_set_ignore_case(gtkStringFilter, ignoreCase);
	}

	/**
	 * Sets the match mode for the filter.
	 *
	 * Params:
	 *     mode = the new match mode
	 */
	public void setMatchMode(GtkStringFilterMatchMode mode)
	{
		gtk_string_filter_set_match_mode(gtkStringFilter, mode);
	}

	/**
	 * Sets the string to search for.
	 *
	 * Params:
	 *     search = The string to search for
	 *         or %NULL to clear the search
	 */
	public void setSearch(string search)
	{
		gtk_string_filter_set_search(gtkStringFilter, Str.toStringz(search));
	}
}
