module gtk.ActionBar;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkActionBar` is designed to present contextual actions.
 * 
 * ![An example GtkActionBar](action-bar.png)
 * 
 * It is expected to be displayed below the content and expand
 * horizontally to fill the area.
 * 
 * It allows placing children at the start or the end. In addition, it
 * contains an internal centered box which is centered with respect to
 * the full width of the box, even if the children at either side take
 * up different amounts of space.
 * 
 * # CSS nodes
 * 
 * `GtkActionBar` has a single CSS node with name actionbar.
 */
public class ActionBar : Widget
{
	/** the main Gtk struct */
	protected GtkActionBar* gtkActionBar;

	/** Get the main Gtk struct */
	public GtkActionBar* getActionBarStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkActionBar;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkActionBar;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkActionBar* gtkActionBar, bool ownedRef = false)
	{
		this.gtkActionBar = gtkActionBar;
		super(cast(GtkWidget*)gtkActionBar, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_action_bar_get_type();
	}

	/**
	 * Creates a new `GtkActionBar` widget.
	 *
	 * Returns: a new `GtkActionBar`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_action_bar_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkActionBar*) __p);
	}

	/**
	 * Retrieves the center bar widget of the bar.
	 *
	 * Returns: the center `GtkWidget` or %NULL.
	 */
	public Widget getCenterWidget()
	{
		auto __p = gtk_action_bar_get_center_widget(gtkActionBar);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Gets whether the contents of the action bar are revealed.
	 *
	 * Returns: the current value of the [property@Gtk.ActionBar:revealed]
	 *     property.
	 */
	public bool getRevealed()
	{
		return gtk_action_bar_get_revealed(gtkActionBar) != 0;
	}

	/**
	 * Adds @child to @action_bar, packed with reference to the
	 * end of the @action_bar.
	 *
	 * Params:
	 *     child = the `GtkWidget` to be added to @action_bar
	 */
	public void packEnd(Widget child)
	{
		gtk_action_bar_pack_end(gtkActionBar, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Adds @child to @action_bar, packed with reference to the
	 * start of the @action_bar.
	 *
	 * Params:
	 *     child = the `GtkWidget` to be added to @action_bar
	 */
	public void packStart(Widget child)
	{
		gtk_action_bar_pack_start(gtkActionBar, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Removes a child from @action_bar.
	 *
	 * Params:
	 *     child = the `GtkWidget` to be removed
	 */
	public void remove(Widget child)
	{
		gtk_action_bar_remove(gtkActionBar, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Sets the center widget for the `GtkActionBar`.
	 *
	 * Params:
	 *     centerWidget = a widget to use for the center
	 */
	public void setCenterWidget(Widget centerWidget)
	{
		gtk_action_bar_set_center_widget(gtkActionBar, (centerWidget is null) ? null : centerWidget.getWidgetStruct());
	}

	/**
	 * Reveals or conceals the content of the action bar.
	 *
	 * Note: this does not show or hide @action_bar in the
	 * [property@Gtk.Widget:visible] sense, so revealing has
	 * no effect if the action bar is hidden.
	 *
	 * Params:
	 *     revealed = The new value of the property
	 */
	public void setRevealed(bool revealed)
	{
		gtk_action_bar_set_revealed(gtkActionBar, revealed);
	}
}