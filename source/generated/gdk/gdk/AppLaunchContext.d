module gdk.AppLaunchContext;

private import gdk.Display;
private import gdk.c.functions;
public  import gdk.c.types;
private import gio.AppLaunchContext : DGioAppLaunchContext = AppLaunchContext;
private import gio.IconIF;
private import glib.Str;
private import gobject.ObjectG;


/**
 * `GdkAppLaunchContext` handles launching an application in a graphical context.
 * 
 * It is an implementation of `GAppLaunchContext` that provides startup
 * notification and allows to launch applications on a specific screen
 * or workspace.
 * 
 * ## Launching an application
 * 
 * ```c
 * GdkAppLaunchContext *context;
 * 
 * context = gdk_display_get_app_launch_context (display);
 * 
 * gdk_app_launch_context_set_display (display);
 * gdk_app_launch_context_set_timestamp (gdk_event_get_time (event));
 * 
 * if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
 * g_warning ("Launching failed: %s\n", error->message);
 * 
 * g_object_unref (context);
 * ```
 */
public class AppLaunchContext : DGioAppLaunchContext
{
	/** the main Gtk struct */
	protected GdkAppLaunchContext* gdkAppLaunchContext;

	/** Get the main Gtk struct */
	public GdkAppLaunchContext* getGdkAppLaunchContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkAppLaunchContext;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkAppLaunchContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkAppLaunchContext* gdkAppLaunchContext, bool ownedRef = false)
	{
		this.gdkAppLaunchContext = gdkAppLaunchContext;
		super(cast(GAppLaunchContext*)gdkAppLaunchContext, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_app_launch_context_get_type();
	}

	/**
	 * Gets the `GdkDisplay` that @context is for.
	 *
	 * Returns: the display of @context
	 */
	public Display getDisplay()
	{
		auto __p = gdk_app_launch_context_get_display(gdkAppLaunchContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Display)(cast(GdkDisplay*) __p);
	}

	/**
	 * Sets the workspace on which applications will be launched.
	 *
	 * This only works when running under a window manager that
	 * supports multiple workspaces, as described in the
	 * [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
	 *
	 * When the workspace is not specified or @desktop is set to -1,
	 * it is up to the window manager to pick one, typically it will
	 * be the current workspace.
	 *
	 * Params:
	 *     desktop = the number of a workspace, or -1
	 */
	public void setDesktop(int desktop)
	{
		gdk_app_launch_context_set_desktop(gdkAppLaunchContext, desktop);
	}

	/**
	 * Sets the icon for applications that are launched with this
	 * context.
	 *
	 * Window Managers can use this information when displaying startup
	 * notification.
	 *
	 * See also [method@Gdk.AppLaunchContext.set_icon_name].
	 *
	 * Params:
	 *     icon = a `GIcon`
	 */
	public void setIcon(IconIF icon)
	{
		gdk_app_launch_context_set_icon(gdkAppLaunchContext, (icon is null) ? null : icon.getIconStruct());
	}

	/**
	 * Sets the icon for applications that are launched with this context.
	 *
	 * The @icon_name will be interpreted in the same way as the Icon field
	 * in desktop files. See also [method@Gdk.AppLaunchContext.set_icon].
	 *
	 * If both @icon and @icon_name are set, the @icon_name takes priority.
	 * If neither @icon or @icon_name is set, the icon is taken from either
	 * the file that is passed to launched application or from the `GAppInfo`
	 * for the launched application itself.
	 *
	 * Params:
	 *     iconName = an icon name
	 */
	public void setIconName(string iconName)
	{
		gdk_app_launch_context_set_icon_name(gdkAppLaunchContext, Str.toStringz(iconName));
	}

	/**
	 * Sets the timestamp of @context.
	 *
	 * The timestamp should ideally be taken from the event that
	 * triggered the launch.
	 *
	 * Window managers can use this information to avoid moving the
	 * focus to the newly launched application when the user is busy
	 * typing in another window. This is also known as 'focus stealing
	 * prevention'.
	 *
	 * Params:
	 *     timestamp = a timestamp
	 */
	public void setTimestamp(uint timestamp)
	{
		gdk_app_launch_context_set_timestamp(gdkAppLaunchContext, timestamp);
	}
}
