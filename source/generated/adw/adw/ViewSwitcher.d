module adw.ViewSwitcher;

private import adw.c.functions;
public  import adw.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Stack;
private import gtk.Widget;


/**
 * An adaptive view switcher.
 * 
 * An adaptive view switcher designed to switch between multiple views
 * contained in a [class@Gtk.Stack] in a similar fashion to
 * [class@Gtk.StackSwitcher].
 * 
 * Depending on the available width, the view switcher can adapt from a wide
 * mode showing the view's icon and title side by side, to a narrow mode showing
 * the view's icon and title one on top of the other, in a more compact way.
 * This can be controlled via the [property@Adw.ViewSwitcher:policy] property.
 * 
 * ## CSS nodes
 * 
 * `AdwViewSwitcher` has a single CSS node with name `viewswitcher`.
 * 
 * ## Accessibility
 * 
 * `AdwViewSwitcher` uses the `GTK_ACCESSIBLE_ROLE_TAB_LIST` role and uses the
 * `GTK_ACCESSIBLE_ROLE_TAB` for its buttons.
 *
 * Since: 1.0
 */
public class ViewSwitcher : Widget
{
	/** the main Gtk struct */
	protected AdwViewSwitcher* adwViewSwitcher;

	/** Get the main Gtk struct */
	public AdwViewSwitcher* getViewSwitcherStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return adwViewSwitcher;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)adwViewSwitcher;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AdwViewSwitcher* adwViewSwitcher, bool ownedRef = false)
	{
		this.adwViewSwitcher = adwViewSwitcher;
		super(cast(GtkWidget*)adwViewSwitcher, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return adw_view_switcher_get_type();
	}

	/**
	 * Creates a new `AdwViewSwitcher`.
	 *
	 * Returns: the newly created `AdwViewSwitcher`
	 *
	 * Since: 1.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = adw_view_switcher_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(AdwViewSwitcher*) __p);
	}

	/**
	 * Gets the ellipsizing position for the titles.
	 *
	 * Returns: the ellipsize mode.
	 *
	 * Since: 1.0
	 */
	public PangoEllipsizeMode getNarrowEllipsize()
	{
		return adw_view_switcher_get_narrow_ellipsize(adwViewSwitcher);
	}

	/**
	 * Gets the policy of @self.
	 *
	 * Returns: the policy of @self
	 *
	 * Since: 1.0
	 */
	public AdwViewSwitcherPolicy getPolicy()
	{
		return adw_view_switcher_get_policy(adwViewSwitcher);
	}

	/**
	 * Gets the stack controlled by @self.
	 *
	 * Returns: the stack
	 *
	 * Since: 1.0
	 */
	public Stack getStack()
	{
		auto __p = adw_view_switcher_get_stack(adwViewSwitcher);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Stack)(cast(GtkStack*) __p);
	}

	/**
	 * Sets the ellipsizing position for the titles.
	 *
	 * Params:
	 *     mode = the new value
	 *
	 * Since: 1.0
	 */
	public void setNarrowEllipsize(PangoEllipsizeMode mode)
	{
		adw_view_switcher_set_narrow_ellipsize(adwViewSwitcher, mode);
	}

	/**
	 * Sets the policy of @self.
	 *
	 * Params:
	 *     policy = the new policy
	 *
	 * Since: 1.0
	 */
	public void setPolicy(AdwViewSwitcherPolicy policy)
	{
		adw_view_switcher_set_policy(adwViewSwitcher, policy);
	}

	/**
	 * Sets the stack controlled by @self.
	 *
	 * Params:
	 *     stack = a stack
	 *
	 * Since: 1.0
	 */
	public void setStack(Stack stack)
	{
		adw_view_switcher_set_stack(adwViewSwitcher, (stack is null) ? null : stack.getStackStruct());
	}
}