module gtk.MenuButton;

private import gio.MenuModel;
private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Popover;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * The `GtkMenuButton` widget is used to display a popup when clicked.
 * 
 * ![An example GtkMenuButton](menu-button.png)
 * 
 * This popup can be provided either as a `GtkPopover` or as an abstract
 * `GMenuModel`.
 * 
 * The `GtkMenuButton` widget can show either an icon (set with the
 * [property@Gtk.MenuButton:icon-name] property) or a label (set with the
 * [property@Gtk.MenuButton:label] property). If neither is explicitly set,
 * a [class@Gtk.Image] is automatically created, using an arrow image oriented
 * according to [property@Gtk.MenuButton:direction] or the generic
 * “open-menu-symbolic” icon if the direction is not set.
 * 
 * The positioning of the popup is determined by the
 * [property@Gtk.MenuButton:direction] property of the menu button.
 * 
 * For menus, the [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign]
 * properties of the menu are also taken into account. For example, when the
 * direction is %GTK_ARROW_DOWN and the horizontal alignment is %GTK_ALIGN_START,
 * the menu will be positioned below the button, with the starting edge
 * (depending on the text direction) of the menu aligned with the starting
 * edge of the button. If there is not enough space below the button, the
 * menu is popped up above the button instead. If the alignment would move
 * part of the menu offscreen, it is “pushed in”.
 * 
 * |           | start                | center                | end                |
 * | -         | ---                  | ---                   | ---                |
 * | **down**  | ![](down-start.png)  | ![](down-center.png)  | ![](down-end.png)  |
 * | **up**    | ![](up-start.png)    | ![](up-center.png)    | ![](up-end.png)    |
 * | **left**  | ![](left-start.png)  | ![](left-center.png)  | ![](left-end.png)  |
 * | **right** | ![](right-start.png) | ![](right-center.png) | ![](right-end.png) |
 * 
 * # CSS nodes
 * 
 * ```
 * menubutton
 * ╰── button.toggle
 * ╰── <content>
 * ╰── [arrow]
 * ```
 * 
 * `GtkMenuButton` has a single CSS node with name `menubutton`
 * which contains a `button` node with a `.toggle` style class.
 * 
 * If the button contains only an icon or an arrow, it will have the
 * `.image-button` style class, if it contains both, it will have the
 * `.arrow-button` style class.
 * 
 * Inside the toggle button content, there is an `arrow` node for
 * the indicator, which will carry one of the `.none`, `.up`, `.down`,
 * `.left` or `.right` style classes to indicate the direction that
 * the menu will appear in. The CSS is expected to provide a suitable
 * image for each of these cases using the `-gtk-icon-source` property.
 * 
 * Optionally, the `menubutton` node can carry the `.circular` style class
 * to request a round appearance.
 * 
 * # Accessibility
 * 
 * `GtkMenuButton` uses the %GTK_ACCESSIBLE_ROLE_BUTTON role.
 */
public class MenuButton : Widget
{
	/** the main Gtk struct */
	protected GtkMenuButton* gtkMenuButton;

	/** Get the main Gtk struct */
	public GtkMenuButton* getMenuButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkMenuButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkMenuButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkMenuButton* gtkMenuButton, bool ownedRef = false)
	{
		this.gtkMenuButton = gtkMenuButton;
		super(cast(GtkWidget*)gtkMenuButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_menu_button_get_type();
	}

	/**
	 * Creates a new `GtkMenuButton` widget with downwards-pointing
	 * arrow as the only child.
	 *
	 * You can replace the child widget with another `GtkWidget`
	 * should you wish to.
	 *
	 * Returns: The newly created `GtkMenuButton`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_menu_button_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkMenuButton*) __p);
	}

	/**
	 * Gets whether to show a dropdown arrow even when using an icon.
	 *
	 * Returns: whether to show a dropdown arrow even when using an icon
	 *
	 * Since: 4.4
	 */
	public bool getAlwaysShowArrow()
	{
		return gtk_menu_button_get_always_show_arrow(gtkMenuButton) != 0;
	}

	/**
	 * Returns the direction the popup will be pointing at when popped up.
	 *
	 * Returns: a `GtkArrowType` value
	 */
	public GtkArrowType getMenuDirection()
	{
		return gtk_menu_button_get_direction(gtkMenuButton);
	}

	/**
	 * Returns whether the button has a frame.
	 *
	 * Returns: %TRUE if the button has a frame
	 */
	public bool getHasFrame()
	{
		return gtk_menu_button_get_has_frame(gtkMenuButton) != 0;
	}

	/**
	 * Gets the name of the icon shown in the button.
	 *
	 * Returns: the name of the icon shown in the button
	 */
	public string getIconName()
	{
		return Str.toString(gtk_menu_button_get_icon_name(gtkMenuButton));
	}

	/**
	 * Gets the label shown in the button
	 *
	 * Returns: the label shown in the button
	 */
	public string getLabel()
	{
		return Str.toString(gtk_menu_button_get_label(gtkMenuButton));
	}

	/**
	 * Returns the `GMenuModel` used to generate the popup.
	 *
	 * Returns: a `GMenuModel`
	 */
	public MenuModel getMenuModel()
	{
		auto __p = gtk_menu_button_get_menu_model(gtkMenuButton);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MenuModel)(cast(GMenuModel*) __p);
	}

	/**
	 * Returns the `GtkPopover` that pops out of the button.
	 *
	 * If the button is not using a `GtkPopover`, this function
	 * returns %NULL.
	 *
	 * Returns: a `GtkPopover` or %NULL
	 */
	public Popover getPopover()
	{
		auto __p = gtk_menu_button_get_popover(gtkMenuButton);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Popover)(cast(GtkPopover*) __p);
	}

	/**
	 * Returns whether the menu button acts as a primary menu.
	 *
	 * Returns: %TRUE if the button is a primary menu
	 *
	 * Since: 4.4
	 */
	public bool getPrimary()
	{
		return gtk_menu_button_get_primary(gtkMenuButton) != 0;
	}

	/**
	 * Returns whether an embedded underline in the text indicates a
	 * mnemonic.
	 *
	 * Returns: %TRUE whether an embedded underline in the text indicates
	 *     the mnemonic accelerator keys.
	 */
	public bool getUseUnderline()
	{
		return gtk_menu_button_get_use_underline(gtkMenuButton) != 0;
	}

	/**
	 * Dismiss the menu.
	 */
	public void popdown()
	{
		gtk_menu_button_popdown(gtkMenuButton);
	}

	/**
	 * Pop up the menu.
	 */
	public void popup()
	{
		gtk_menu_button_popup(gtkMenuButton);
	}

	/**
	 * Sets whether to show a dropdown arrow even when using an icon.
	 *
	 * Params:
	 *     alwaysShowArrow = hether to show a dropdown arrow even when using an icon
	 *
	 * Since: 4.4
	 */
	public void setAlwaysShowArrow(bool alwaysShowArrow)
	{
		gtk_menu_button_set_always_show_arrow(gtkMenuButton, alwaysShowArrow);
	}

	/**
	 * Sets @func to be called when a popup is about to be shown.
	 *
	 * @func should use one of
	 *
	 * - [method@Gtk.MenuButton.set_popover]
	 * - [method@Gtk.MenuButton.set_menu_model]
	 *
	 * to set a popup for @menu_button.
	 * If @func is non-%NULL, @menu_button will always be sensitive.
	 *
	 * Using this function will not reset the menu widget attached to
	 * @menu_button. Instead, this can be done manually in @func.
	 *
	 * Params:
	 *     func = function to call when a popup is about to
	 *         be shown, but none has been provided via other means, or %NULL
	 *         to reset to default behavior.
	 *     userData = user data to pass to @func.
	 *     destroyNotify = destroy notify for @user_data
	 */
	public void setCreatePopupFunc(GtkMenuButtonCreatePopupFunc func, void* userData, GDestroyNotify destroyNotify)
	{
		gtk_menu_button_set_create_popup_func(gtkMenuButton, func, userData, destroyNotify);
	}

	/**
	 * Sets the direction in which the popup will be popped up.
	 *
	 * If the button is automatically populated with an arrow icon,
	 * its direction will be changed to match.
	 *
	 * If the does not fit in the available space in the given direction,
	 * GTK will its best to keep it inside the screen and fully visible.
	 *
	 * If you pass %GTK_ARROW_NONE for a @direction, the popup will behave
	 * as if you passed %GTK_ARROW_DOWN (although you won’t see any arrows).
	 *
	 * Params:
	 *     direction = a `GtkArrowType`
	 */
	public void setMenuDirection(GtkArrowType direction)
	{
		gtk_menu_button_set_direction(gtkMenuButton, direction);
	}

	/**
	 * Sets the style of the button.
	 *
	 * Params:
	 *     hasFrame = whether the button should have a visible frame
	 */
	public void setHasFrame(bool hasFrame)
	{
		gtk_menu_button_set_has_frame(gtkMenuButton, hasFrame);
	}

	/**
	 * Sets the name of an icon to show inside the menu button.
	 *
	 * Params:
	 *     iconName = the icon name
	 */
	public void setIconName(string iconName)
	{
		gtk_menu_button_set_icon_name(gtkMenuButton, Str.toStringz(iconName));
	}

	/**
	 * Sets the label to show inside the menu button.
	 *
	 * Params:
	 *     label = the label
	 */
	public void setLabel(string label)
	{
		gtk_menu_button_set_label(gtkMenuButton, Str.toStringz(label));
	}

	/**
	 * Sets the `GMenuModel` from which the popup will be constructed.
	 *
	 * If @menu_model is %NULL, the button is disabled.
	 *
	 * A [class@Gtk.Popover] will be created from the menu model with
	 * [ctor@Gtk.PopoverMenu.new_from_model]. Actions will be connected
	 * as documented for this function.
	 *
	 * If [property@Gtk.MenuButton:popover] is already set, it will be
	 * dissociated from the @menu_button, and the property is set to %NULL.
	 *
	 * Params:
	 *     menuModel = a `GMenuModel`, or %NULL to unset and disable the
	 *         button
	 */
	public void setMenuModel(MenuModel menuModel)
	{
		gtk_menu_button_set_menu_model(gtkMenuButton, (menuModel is null) ? null : menuModel.getMenuModelStruct());
	}

	/**
	 * Sets the `GtkPopover` that will be popped up when the @menu_button is clicked.
	 *
	 * If @popover is %NULL, the button is disabled.
	 *
	 * If [property@Gtk.MenuButton:menu-model] is set, the menu model is dissociated
	 * from the @menu_button, and the property is set to %NULL.
	 *
	 * Params:
	 *     popover = a `GtkPopover`, or %NULL to unset and disable the button
	 */
	public void setPopover(Widget popover)
	{
		gtk_menu_button_set_popover(gtkMenuButton, (popover is null) ? null : popover.getWidgetStruct());
	}

	/**
	 * Sets whether menu button acts as a primary menu.
	 *
	 * Primary menus can be opened with the <kbd>F10</kbd> key.
	 *
	 * Params:
	 *     primary = whether the menubutton should act as a primary menu
	 *
	 * Since: 4.4
	 */
	public void setPrimary(bool primary)
	{
		gtk_menu_button_set_primary(gtkMenuButton, primary);
	}

	/**
	 * If true, an underline in the text indicates a mnemonic.
	 *
	 * Params:
	 *     useUnderline = %TRUE if underlines in the text indicate mnemonics
	 */
	public void setUseUnderline(bool useUnderline)
	{
		gtk_menu_button_set_use_underline(gtkMenuButton, useUnderline);
	}

	/**
	 * Emitted to when the menu button is activated.
	 *
	 * The `::activate` signal on `GtkMenuButton` is an action signal and
	 * emitting it causes the button to pop up its menu.
	 *
	 * Since: 4.4
	 */
	gulong addOnActivate(void delegate(MenuButton) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
