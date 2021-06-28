module gtk.StackPage;

private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkStackPage` is an auxiliary class used by `GtkStack`.
 */
public class StackPage : ObjectG, AccessibleIF
{
	/** the main Gtk struct */
	protected GtkStackPage* gtkStackPage;

	/** Get the main Gtk struct */
	public GtkStackPage* getStackPageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkStackPage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkStackPage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkStackPage* gtkStackPage, bool ownedRef = false)
	{
		this.gtkStackPage = gtkStackPage;
		super(cast(GObject*)gtkStackPage, ownedRef);
	}

	// add the Accessible capabilities
	mixin AccessibleT!(GtkStackPage);


	/** */
	public static GType getType()
	{
		return gtk_stack_page_get_type();
	}

	/**
	 * Returns the stack child to which @self belongs.
	 *
	 * Returns: the child to which @self belongs
	 */
	public Widget getChild()
	{
		auto __p = gtk_stack_page_get_child(gtkStackPage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Returns the icon name of the page.
	 *
	 * Returns: The value of the [property@Gtk.StackPage:icon-name] property
	 */
	public string getIconName()
	{
		return Str.toString(gtk_stack_page_get_icon_name(gtkStackPage));
	}

	/**
	 * Returns the name of the page.
	 *
	 * Returns: The value of the [property@Gtk.StackPage:name] property
	 */
	public string getName()
	{
		return Str.toString(gtk_stack_page_get_name(gtkStackPage));
	}

	/**
	 * Returns whether the page is marked as “needs attention”.
	 *
	 * Returns: The value of the [property@Gtk.StackPage:needs-attention]
	 *     property.
	 */
	public bool getNeedsAttention()
	{
		return gtk_stack_page_get_needs_attention(gtkStackPage) != 0;
	}

	/**
	 * Gets the page title.
	 *
	 * Returns: The value of the [property@Gtk.StackPage:title] property
	 */
	public string getTitle()
	{
		return Str.toString(gtk_stack_page_get_title(gtkStackPage));
	}

	/**
	 * Gets whether underlines in the page title indicate mnemonics.
	 *
	 * Returns: The value of the [property@Gtk.StackPage:use-underline] property
	 */
	public bool getUseUnderline()
	{
		return gtk_stack_page_get_use_underline(gtkStackPage) != 0;
	}

	/**
	 * Returns whether @page is visible in its `GtkStack`.
	 *
	 * This is independent from the [property@Gtk.Widget:visible]
	 * property of its widget.
	 *
	 * Returns: %TRUE if @page is visible
	 */
	public bool getVisible()
	{
		return gtk_stack_page_get_visible(gtkStackPage) != 0;
	}

	/**
	 * Sets the icon name of the page.
	 *
	 * Params:
	 *     setting = the new value to set
	 */
	public void setIconName(string setting)
	{
		gtk_stack_page_set_icon_name(gtkStackPage, Str.toStringz(setting));
	}

	/**
	 * Sets the name of the page.
	 *
	 * Params:
	 *     setting = the new value to set
	 */
	public void setName(string setting)
	{
		gtk_stack_page_set_name(gtkStackPage, Str.toStringz(setting));
	}

	/**
	 * Sets whether the page is marked as “needs attention”.
	 *
	 * Params:
	 *     setting = the new value to set
	 */
	public void setNeedsAttention(bool setting)
	{
		gtk_stack_page_set_needs_attention(gtkStackPage, setting);
	}

	/**
	 * Sets the page title.
	 *
	 * Params:
	 *     setting = the new value to set
	 */
	public void setTitle(string setting)
	{
		gtk_stack_page_set_title(gtkStackPage, Str.toStringz(setting));
	}

	/**
	 * Sets whether underlines in the page title indicate mnemonics.
	 *
	 * Params:
	 *     setting = the new value to set
	 */
	public void setUseUnderline(bool setting)
	{
		gtk_stack_page_set_use_underline(gtkStackPage, setting);
	}

	/**
	 * Sets whether @page is visible in its `GtkStack`.
	 *
	 * Params:
	 *     visible = The new property value
	 */
	public void setVisible(bool visible)
	{
		gtk_stack_page_set_visible(gtkStackPage, visible);
	}
}
