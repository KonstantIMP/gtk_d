module adw.ExpanderRow;

private import adw.PreferencesRow;
private import adw.c.functions;
public  import adw.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.Widget;


/**
 * A [class@Gtk.ListBoxRow] used to reveal widgets.
 * 
 * The `AdwExpanderRow` widget allows the user to reveal or hide widgets below
 * it. It also allows the user to enable the expansion of the row, allowing to
 * disable all that the row contains.
 * 
 * ## AdwExpanderRow as GtkBuildable
 * 
 * The `AdwExpanderRow` implementation of the [iface@Gtk.Buildable] interface
 * supports adding a child as an action widget by specifying “action” as the
 * “type” attribute of a <child> element.
 * 
 * It also supports adding it as a prefix widget by specifying “prefix” as the
 * “type” attribute of a <child> element.
 * 
 * ## CSS nodes
 * 
 * `AdwExpanderRow` has a main CSS node with name `row` and the `.expander`
 * style class. It has the `.empty` style class when it contains no children.
 * 
 * It contains the subnodes `row.header` for its main embedded row,
 * `list.nested` for the list it can expand, and `image.expander-row-arrow` for
 * its arrow.
 * 
 * When expanded, `AdwExpanderRow` will add the
 * `.checked-expander-row-previous-sibling` style class to its previous sibling,
 * and remove it when retracted.
 *
 * Since: 1.0
 */
public class ExpanderRow : PreferencesRow
{
	/** the main Gtk struct */
	protected AdwExpanderRow* adwExpanderRow;

	/** Get the main Gtk struct */
	public AdwExpanderRow* getExpanderRowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwExpanderRow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwExpanderRow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwExpanderRow* adwExpanderRow, bool ownedRef = false)
	{
		this.adwExpanderRow = adwExpanderRow;
		super(cast(AdwPreferencesRow*)adwExpanderRow, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return adw_expander_row_get_type();
	}

	/**
	 * Creates a new `AdwExpanderRow`.
	 *
	 * Returns: the newly created `AdwExpanderRow`
	 *
	 * Since: 1.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = adw_expander_row_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AdwExpanderRow*) __p);
	}

	/**
	 * Adds a widget to @self.
	 *
	 * The widget will appear in the expanding list below @self.
	 *
	 * Params:
	 *     child = a widget
	 *
	 * Since: 1.0
	 */
	public void add(Widget child)
	{
		adw_expander_row_add(adwExpanderRow, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Adds an action widget to @self.
	 *
	 * Params:
	 *     widget = a widget
	 *
	 * Since: 1.0
	 */
	public void addAction(Widget widget)
	{
		adw_expander_row_add_action(adwExpanderRow, (widget is null) ? null : widget.getWidgetStruct());
	}

	/**
	 * Adds a prefix widget to @self.
	 *
	 * Params:
	 *     widget = a widget
	 *
	 * Since: 1.0
	 */
	public void addPrefix(Widget widget)
	{
		adw_expander_row_add_prefix(adwExpanderRow, (widget is null) ? null : widget.getWidgetStruct());
	}

	/**
	 * Gets whether the expansion of @self is enabled.
	 *
	 * Returns: whether the expansion of @self is enabled.
	 *
	 * Since: 1.0
	 */
	public bool getEnableExpansion()
	{
		return adw_expander_row_get_enable_expansion(adwExpanderRow) != 0;
	}

	/**
	 * Gets whether @self is expanded.
	 *
	 * Returns: whether @self is expanded
	 *
	 * Since: 1.0
	 */
	public bool getExpanded()
	{
		return adw_expander_row_get_expanded(adwExpanderRow) != 0;
	}

	/**
	 * Gets the icon name for @self.
	 *
	 * Returns: the icon name for @self
	 *
	 * Since: 1.0
	 */
	public string getIconName()
	{
		return Str.toString(adw_expander_row_get_icon_name(adwExpanderRow));
	}

	/**
	 * Gets whether the switch enabling the expansion of @self is visible.
	 *
	 * Returns: whether the switch enabling the expansion is visible
	 *
	 * Since: 1.0
	 */
	public bool getShowEnableSwitch()
	{
		return adw_expander_row_get_show_enable_switch(adwExpanderRow) != 0;
	}

	/**
	 * Gets the subtitle for @self.
	 *
	 * Returns: the subtitle for @self
	 *
	 * Since: 1.0
	 */
	public string getSubtitle()
	{
		return Str.toString(adw_expander_row_get_subtitle(adwExpanderRow));
	}

	/**
	 * Gets whether underlines in title or subtitle are interpreted as mnemonics.
	 *
	 * Returns: `TRUE` if underlines are interpreted as mnemonics
	 *
	 * Since: 1.0
	 */
	public override bool getUseUnderline()
	{
		return adw_expander_row_get_use_underline(adwExpanderRow) != 0;
	}

	/** */
	public void remove(Widget child)
	{
		adw_expander_row_remove(adwExpanderRow, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Sets whether the expansion of @self is enabled.
	 *
	 * Params:
	 *     enableExpansion = whether to enable the expansion
	 *
	 * Since: 1.0
	 */
	public void setEnableExpansion(bool enableExpansion)
	{
		adw_expander_row_set_enable_expansion(adwExpanderRow, enableExpansion);
	}

	/**
	 * Sets whether @self is expanded.
	 *
	 * Params:
	 *     expanded = whether to expand the row
	 *
	 * Since: 1.0
	 */
	public void setExpanded(bool expanded)
	{
		adw_expander_row_set_expanded(adwExpanderRow, expanded);
	}

	/**
	 * Sets the icon name for @self.
	 *
	 * Params:
	 *     iconName = the icon name
	 *
	 * Since: 1.0
	 */
	public void setIconName(string iconName)
	{
		adw_expander_row_set_icon_name(adwExpanderRow, Str.toStringz(iconName));
	}

	/**
	 * Sets whether the switch enabling the expansion of @self is visible.
	 *
	 * Params:
	 *     showEnableSwitch = whether to show the switch enabling the expansion
	 *
	 * Since: 1.0
	 */
	public void setShowEnableSwitch(bool showEnableSwitch)
	{
		adw_expander_row_set_show_enable_switch(adwExpanderRow, showEnableSwitch);
	}

	/**
	 * Sets the subtitle for @self.
	 *
	 * Params:
	 *     subtitle = the subtitle
	 *
	 * Since: 1.0
	 */
	public void setSubtitle(string subtitle)
	{
		adw_expander_row_set_subtitle(adwExpanderRow, Str.toStringz(subtitle));
	}

	/**
	 * Sets whether underlines in title or subtitle are interpreted as mnemonics.
	 *
	 * Params:
	 *     useUnderline = whether underlines are interpreted as mnemonics
	 *
	 * Since: 1.0
	 */
	public override void setUseUnderline(bool useUnderline)
	{
		adw_expander_row_set_use_underline(adwExpanderRow, useUnderline);
	}
}