module gio.MemoryMonitorIF;

private import gio.MemoryMonitorIF;
private import gio.c.functions;
public  import gio.c.types;
private import gobject.ObjectG;
private import gobject.Signals;
private import std.algorithm;


/**
 * #GMemoryMonitor will monitor system memory and suggest to the application
 * when to free memory so as to leave more room for other applications.
 * It is implemented on Linux using the [Low Memory Monitor](https://gitlab.freedesktop.org/hadess/low-memory-monitor/)
 * ([API documentation](https://hadess.pages.freedesktop.org/low-memory-monitor/)).
 * 
 * There is also an implementation for use inside Flatpak sandboxes.
 * 
 * Possible actions to take when the signal is received are:
 * 
 * - Free caches
 * - Save files that haven't been looked at in a while to disk, ready to be reopened when needed
 * - Run a garbage collection cycle
 * - Try and compress fragmented allocations
 * - Exit on idle if the process has no reason to stay around
 * - Call [`malloc_trim(3)`](man:malloc_trim) to return cached heap pages to
 * the kernel (if supported by your libc)
 * 
 * Note that some actions may not always improve system performance, and so
 * should be profiled for your application. `malloc_trim()`, for example, may
 * make future heap allocations slower (due to releasing cached heap pages back
 * to the kernel).
 * 
 * See #GMemoryMonitorWarningLevel for details on the various warning levels.
 * 
 * |[<!-- language="C" -->
 * static void
 * warning_cb (GMemoryMonitor *m, GMemoryMonitorWarningLevel level)
 * {
 * g_debug ("Warning level: %d", level);
 * if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)
 * drop_caches ();
 * }
 * 
 * static GMemoryMonitor *
 * monitor_low_memory (void)
 * {
 * GMemoryMonitor *m;
 * m = g_memory_monitor_dup_default ();
 * g_signal_connect (G_OBJECT (m), "low-memory-warning",
 * G_CALLBACK (warning_cb), NULL);
 * return m;
 * }
 * ]|
 * 
 * Don't forget to disconnect the #GMemoryMonitor::low-memory-warning
 * signal, and unref the #GMemoryMonitor itself when exiting.
 *
 * Since: 2.64
 */
public interface MemoryMonitorIF{
	/** Get the main Gtk struct */
	public GMemoryMonitor* getMemoryMonitorStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_memory_monitor_get_type();
	}

	/**
	 * Gets a reference to the default #GMemoryMonitor for the system.
	 *
	 * Returns: a new reference to the default #GMemoryMonitor
	 *
	 * Since: 2.64
	 */
	public static MemoryMonitorIF dupDefault()
	{
		auto __p = g_memory_monitor_dup_default();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MemoryMonitorIF)(cast(GMemoryMonitor*) __p, true);
	}

	/**
	 * Emitted when the system is running low on free memory. The signal
	 * handler should then take the appropriate action depending on the
	 * warning level. See the #GMemoryMonitorWarningLevel documentation for
	 * details.
	 *
	 * Params:
	 *     level = the #GMemoryMonitorWarningLevel warning level
	 *
	 * Since: 2.64
	 */
	gulong addOnLowMemoryWarning(void delegate(GMemoryMonitorWarningLevel, MemoryMonitorIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
}
